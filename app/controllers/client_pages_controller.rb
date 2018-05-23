class ClientPagesController < ApplicationController
  def get_lecture_list
    @lectures = MsuLecture.all
    respond_to do |format|
      format.js
    end
  end

  def get_lecture_content
    @lecture = MsuLecture.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def set_discipline
    @id = params[:id]
    @title = params[:title]
    respond_to do |format|
      format.js
    end
  end
end
