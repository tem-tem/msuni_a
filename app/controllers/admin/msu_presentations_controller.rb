class Admin::MsuPresentationsController < ApplicationController

  def index
    @presentations = MsuPresentation.all
  end

  def new
    @lecture = MsuLecture.find(params[:msu_lecture_id])
    @presentation = @lecture.msu_presentations.build
  end

  def create
    file_param = params[:msu_presentation][:file]
    @lecture = MsuLecture.find(params[:msu_lecture_id])
    @presentation = @lecture.msu_presentations.build(presentation_params)
    @presentation.filename = file_param.original_filename
    if @presentation.save
      redirect_to([:admin, @lecture.msu_discipline, @lecture])
      upload(file_param, 'msu_presentations')
      flash[:success] = 'Презентация загружена'
    else
      flash[:danger] = @presentation.errors.full_messages.to_sentence
      render :new
    end
  end

  def upload(file_param, dir)
    # param -- ex. params[:msu_presentation][:file]
    # dir -- foldername in public folder

    file_param
    File.open(Rails.root.join('public', dir,
              file_param.original_filename), 'wb') do |file|
      file.write(file_param.read)
    end
  end

  private

    def presentation_params
      params.require(:msu_presentation).permit(:title,
                                               :visible)
    end
end
