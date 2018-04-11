class MsuDisciplinesController < ApplicationController
  def index
    @disciplines = MsuDiscipline.all

  end

  def show
    @discipline = MsuDiscipline.find(params[:id])
    @lectures = @discipline.msu_lectures.all
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
          flash.now[:error] = @discipline.errors.messages[:title].first.to_s
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
          flash.now[:error] = 'ok'
        else
          flash.now[:error] = @discipline.errors.messages[:title].first.to_s
          logger.debug flash.now[:error]
          render action: :edit
        end
      end
    end
  end

  def destroy
    @discipline = MsuDiscipline.destroy(params[:id])

    respond_to do |f|
      f.html { redirect_to disciplines_path }
      f.js
    end
  end

  private
  def discipline_params
    params.require(:msu_discipline).permit(:title)
  end
end
