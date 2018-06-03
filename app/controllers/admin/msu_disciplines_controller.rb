class Admin::MsuDisciplinesController < ApplicationController
  def index
    @disciplines = MsuDiscipline.all
  end

  def show
    @discipline = MsuDiscipline.find(params[:id])
    @disciplines = MsuDiscipline.all
    if not @discipline
      flash[:danger] = @discipline.errors.full_messages.to_sentence
      redirect_to [:admin, :msu_disciplines]
    end

  end

  def new
    @discipline = MsuDiscipline.new
    respond_to do |f|
      f.js
    end
  end

  def create
    @discipline = MsuDiscipline.new(discipline_params)
    if @discipline.save
      flash.now[:success] = 'Дисциплина создана'
      respond_to do |f|
        f.js {redirect_to [:admin, @discipline]}
      end
    else
      flash.now[:danger] = @discipline.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @discipline = MsuDiscipline.find(params[:id])
    respond_to do |f|
      f.js
    end
  end

  def update
    @discipline = MsuDiscipline.find(params[:id])
    @discipline.update(discipline_params)
    if @discipline.valid?
      flash.now[:success] = 'Дисциплина сохранена'
    else
      flash.now[:danger] = @discipline.errors.full_messages.to_sentence
      edit
    end
  end

  def destroy
    flash.now[:success] = "Дисциплина удалена"
    @discipline = MsuDiscipline.destroy(params[:id])
    redirect_to [:admin, :msu_disciplines]
  end

  def toggle
    @id = params[:id]
    discipline = MsuDiscipline.find(@id)
    discipline.visible = !discipline.visible
    discipline.save!
  end

  private
  def discipline_params
    params.require(:msu_discipline).permit(:title)
  end
end
