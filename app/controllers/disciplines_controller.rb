class DisciplinesController < ApplicationController

  def index
    @disciplines = MsuDiscipline.where(visible: true).all
  end

  def show
    @discipline = MsuDiscipline.where(visible: true).find(params[:id])
    if @discipline
      @d_title = @discipline.title
    else
      redirect_to root_path
    end
  end
end
