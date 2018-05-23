class Admin::MsuImagesController < ApplicationController

  def new
    @lecture = MsuLecture.find(params[:msu_lecture_id])
    @image = @lecture.msu_images.build()
    respond_to do |f|
      f.js
    end
  end

  def create
    @lecture = MsuLecture.find(params[:msu_lecture_id])
    @new_images = []
    image_params[:images].each do |img|
      new_image = @lecture.msu_images.build()
      new_image.image = img
      new_image.title = img.original_filename
      if new_image.save
        @new_images.push(new_image)
      else
        flash[:danger] = 'Некоторые файлы не загрузились'
      end
    end

    redirect_to [:edit, :admin, @lecture.msu_discipline, @lecture]

  end

  private

    def image_params
      params.require(:msu_image).permit(images: [])
    end

end
