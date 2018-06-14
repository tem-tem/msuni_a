class Admin::MsuLecturesController < ApplicationController

  def index
    @disciplines = MsuDiscipline.all
  end

  def new
    @discipline = MsuDiscipline.find(params[:msu_discipline_id])
    @lecture = @discipline.msu_lectures.build
    respond_to do |format|
      format.js
    end
  end

  def create
    @discipline = MsuDiscipline.find(params[:msu_discipline_id])
    @lecture = @discipline.msu_lectures.build(lecture_params)
    @lecture.order = @discipline.msu_lectures.count + 1
    if @lecture.save
      redirect_to([:edit, :admin, @discipline, @lecture])
    else
      flash.now[:danger] = @lecture.errors.full_messages.to_sentence
      render :new
    end

  end

  def show
    if MsuLecture.exists?(params[:id])
      @lecture = MsuLecture.find(params[:id])
    else
      redirect_to [:admin, :msu_disciplines]
    end
  end

  def edit
      @lecture = MsuLecture.find(params[:id])
  end

  def update
    respond_to do |format|
      @lecture = MsuLecture.find(params[:id])
      @lecture.update(lecture_params)
      if @lecture.valid?
        flash.now[:success] = 'Лекция сохранена'
      else
        flash.now[:danger] = @lecture.errors.full_messages.to_sentence
      end
      format.js
    end

  end

  def destroy
    if MsuLecture.exists?(params[:id])
      @lecture = MsuLecture.find(params[:id])
      @lecture.destroy
    end

    respond_to do |format|
      format.html {redirect_back(fallback_location: [:admin, :msu_disciplines])}
      format.js
    end
  end

  # def save
  #   lecture = MsuLecture.find(params[:msu_lecture_id])
  #   unless lecture.update(lecture_params)
  #     flash.now[:danger] = lecture.errors.full_messages.to_sentence
  #   end
  #
  #   respond_to do |format|
  #     f.js
  #   end
  # end

  def toggle
    @id = params[:id]
    lecture = MsuLecture.find(@id)
    lecture.visible = !lecture.visible
    lecture.save!
  end

  def reorder
    new_order = params[:new_order]
    new_order.each_with_index do |lecture_id, index|
      lecture = MsuLecture.find(lecture_id.to_i)
      lecture.order = index + 1
      lecture.save!
    end
  end

  private

  def lecture_params
    params.require(:msu_lecture).permit(:title, :content)
  end

end
