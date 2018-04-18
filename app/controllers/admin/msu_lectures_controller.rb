class Admin::MsuLecturesController < ApplicationController

  def index
    @disciplines = MsuDiscipline.all
  end

  def new
    @discipline = MsuDiscipline.find(params[:msu_discipline_id])
    @lecture = @discipline.msu_lectures.build
  end

  def create
    @discipline = MsuDiscipline.find(params[:msu_discipline_id])
    @lecture = @discipline.msu_lectures.build(lecture_params)

    if @lecture.save
      redirect_to([:admin, @discipline, @lecture])
      flash[:success] = 'Лекция создана'
    else
      flash[:danger] = @lecture.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @lecture = MsuLecture.find(params[:id])
  end

  def edit
    @lecture = MsuLecture.find(params[:id])
  end

  def update
    @lecture = MsuLecture.find(params[:id])
    @lecture.update(lecture_params)

    if @lecture.valid?
      redirect_to([:admin, @lecture.msu_discipline, @lecture])
      flash[:success] = 'Лекция обновлена'
    else
      flash[:danger] = @lecture.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @lecture = MsuLecture.find(params[:id])
    @lecture.destroy
  end

  private

  def lecture_params
    params.require(:msu_lecture).permit(:title, :content)
  end

end
