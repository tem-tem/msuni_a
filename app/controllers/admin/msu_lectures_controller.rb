class Admin::MsuLecturesController < ApplicationController

  def index
    @discipline = MsuDiscipline.find(params[:msu_discipline_id])
    @lectures = @discipline.msu_lectures.all
  end

  def new
    @discipline = MsuDiscipline.find(params[:msu_discipline_id])
    @lecture = @discipline.msu_lectures.build
  end

  def create
    @discipline = MsuDiscipline.find(params[:msu_discipline_id])
    @lecture = @discipline.msu_lectures.build(lecture_params)

    if @lecture.save
      redirect_to(@discipline)
      flash[:success] = 'Лекция сохранена'
    else
      flash.now[:error] = @lecture.errors.full_messages
      render :new
    end

  end

  private

  def lecture_params
    params.require(:msu_lecture).permit(:title, :content)
  end

end
