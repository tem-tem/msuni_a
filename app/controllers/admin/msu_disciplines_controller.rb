class Admin::MsuDisciplinesController < ApplicationController
  def index
    @disciplines = MsuDiscipline.all
  end

  def show
    @discipline = MsuDiscipline.find(params[:id])

    respond_to do |f|
      f.js do
        if @discipline
          flash.now[:error] = 'ok'
        else
          flash.now[:danger] = @discipline.errors.messages[:title].first.to_s
          redirect_to [:admin, :msu_disciplines]
        end
      end
    end
  end

  def new
    @discipline = MsuDiscipline.new
  end

  def create
    @discipline = MsuDiscipline.create(discipline_params)

    respond_to do |f|
      f.js do
        if @discipline.valid?
          flash.now[:error] = 'ok'
        else
          flash.now[:error] = @discipline.errors.full_messages.to_sentence
          render action: :new
        end
      end
    end
  end

  def edit
    @discipline = MsuDiscipline.find(params[:id])
  end

  def update
    @discipline = MsuDiscipline.find(params[:id])
    @discipline.update(discipline_params)

    respond_to do |f|
      f.js do
        if @discipline.valid?
          flash.now[:success] = 'Дисциплина сохранена'
        else
          flash.now[:error] = @discipline.errors.full_messages.to_sentence
          render action: :edit
        end
      end
    end
  end

  def destroy
    @discipline = MsuDiscipline.destroy(params[:id])

    respond_to do |f|
      f.html { render :index }
      f.js
    end
  end

  private
  def discipline_params
    params.require(:msu_discipline).permit(:title)
  end
end
