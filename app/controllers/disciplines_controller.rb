class DisciplinesController < ApplicationController

  def index
    @disciplines = MsuDiscipline.where(visible: true).all
  end

  def show
    if @discipline = MsuDiscipline.where(visible: true).find(params[:id])
      @d_title = @discipline.title
    else
      redirect_to root_path
    end
  end
end
