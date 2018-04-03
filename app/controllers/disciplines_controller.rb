class DisciplinesController < ApplicationController
  def index
    @disciplines = Discipline.all
  end
  def show
    @disciplines = Discipline.find(params[:id])
  end

  def new
    @discipline = Discipline.new
  end

  def create
    @discipline = Discipline.create(discipline_params)

    respond_to do |f|
      f.js do
        if @discipline.valid?
          flash.now[:error] = 'ok'
        else
          flash.now[:error] = @discipline.errors.messages[:name].first.to_s
          render action: :new
        end
      end
    end
  end

  def destroy
    @discipline = Discipline.destroy(params[:id])

    respond_to do |f|
      f.html { redirect_to disciplines_path }
      f.js
    end
  end

  def testalert

  end

end
