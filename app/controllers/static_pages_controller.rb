class StaticPagesController < ApplicationController
  def admin
  end

  def client_side
    @disciplines = MsuDiscipline.all
  end
end
