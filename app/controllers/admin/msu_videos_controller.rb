class Admin::MsuVideosController < ApplicationController
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  def new
    discipline = MsuDiscipline.find(params[:msu_discipline_id])
    @video = discipline.msu_videos.build()
  end

  def create
    link = params[:msu_video][:link]
    vi_d = parse_video(link)
    discipline = MsuDiscipline.find(params[:msu_discipline_id])
    if vi_d
      @video = discipline.msu_videos.build(vi_d)
      @video.link = link
      if @video.save
        redirect_to [:admin, @video.msu_discipline, anchor: 'nav-videos']
      else
        flash.now[:danger] = @video.errors.full_messages.to_sentence
        render :new
      end
    else
      @video = discipline.msu_videos.build()
      render :new
    end
  end

  def destroy
    @video = MsuVideo.find(params[:id])
    title = @video.title
    if @video.destroy
      flash[:success] = "Видео " + title[0,20] + "... удалено"
    else
      flash[:danger] = @video.errors.full_messages.to_sentence
    end
    redirect_to [:admin, @video.msu_discipline, anchor: 'nav-videos']
  end

  def get_details(data)
    if data['items'].length > 0
      video = Hash.new
      video[:video_id] = data['items'].first['id']
      video[:title] = data['items'].first['snippet']['title']
      video[:description] = data['items'].first['snippet']['description']
      video[:thumbnail] = data['items'].first['snippet']['thumbnails']['standard']['url']

      iso8601 = data['items'].first['contentDetails']['duration']
      md = /PT(?:([0-9]*)H)*(?:([0-9]*)M)*(?:([0-9.]*)S)*/.match(iso8601)
      hours = md[1]
      minutes = md[2] ? md[2] : '00'
      seconds = md[3] ? md[3] : '00'
      duration = [hours, minutes, seconds].reject(&:blank?).join(':')
      video[:duration] = duration

      video
    else
      flash.now[:danger] = 'Видео не найдено'
      false
    end
  end

  def parse_video(link)
    require 'net/http'

    video_id = get_video_id(link)
    if video_id
      base_url = 'https://www.googleapis.com/youtube/v3/videos?'
      part = 'part=snippet,contentDetails'
      id = "id=#{video_id}"
      key = 'key=' + Rails.application.secrets.YT_SECRET.to_s
      url = [base_url + part, id, key].join('&')

      uri = URI(url)
      response = Net::HTTP.get(uri)
      data = JSON.parse(response)
      if data
        get_details(data)
      end
    else
      flash.now[:danger] = 'Неккоректная ссылка'
      false
    end
  end

  def get_video_id(link)
    md = /http(?:s?):\/\/(?:www\.)?youtu(?:be\.com\/watch\?v=|\.be\/)([\w\-\_]*)(&(amp;)?‌​[\w\?‌​=]*)?/.match(link)
    if md
      md[1]
    else
      false
    end
  end

end
