class MsuLecturesController < ApplicationController
  def index
    @lectures = MsuLecture.where(msu_disciplines_id: params['msu_discipline_id']).all
  end
  def new


    @discipline = MsuDiscipline.find(params[:msu_discipline_id])
    @lecture = MsuLecture.new


  end
  def create

    @discipline = MsuDiscipline.find(params[:msu_discipline_id])
    MsuLecture.create(lecture_params)

      if @lecture.save
      redirect_to(root_path)
    end

  end

  private

  def lecture_params
    params.require(:msu_lecture).permit(:title, :content, :msu_discipline_id)
  end

end
