class Admin::MsuPresentationsController < ApplicationController

  def new
    @lecture = MsuLecture.find(params[:msu_lecture_id])
    @presentation = @lecture.msu_presentations.build
  end

  def create
    @lecture = MsuLecture.find(params[:msu_lecture_id])
    @presentation = @lecture.msu_presentations.build

    pdf = params[:msu_presentation][:pdf]
    @presentation.title = pdf.original_filename
    @presentation.pdf = pdf

    if @presentation.save
      redirect_back(fallback_location: [:admin, @lecture.msu_discipline, anchor: 'nav-presentations'])
      flash[:success] = @presentation.title + ' - загружен успешно'
    else
      flash[:danger] = @presentation.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @presentation = MsuPresentation.find(params[:id])
    if @presentation.destroy
      flash[:success] = 'Презентация удалена'
    else
      flash[:danger] = @presentation.errors.full_messages.to_sentence
    end
    redirect_back(fallback_location: [:admin, :msu_disciplines])
  end

end
