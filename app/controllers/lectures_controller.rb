class LecturesController < ApplicationController
  def index
    @lectures = MsuLecture.where(visible: true, msu_discipline_id: params[:discipline_id]).all
    @d_title = MsuDiscipline.find(params[:discipline_id]).title
  end

  def show
    @lecture = MsuLecture.where(visible: true).find(params[:id])
    if @lecture
      @d_title = @lecture.msu_discipline.title
    else
      redirect_to root_path
    end
  end
end
