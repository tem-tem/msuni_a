class Admin::MsuPresentationsController < ApplicationController

  def index
    @presentations = MsuPresentation.all
  end

  def new
    @lecture = MsuLecture.find(params[:msu_lecture_id])
    @presentation = @lecture.msu_presentations.build
  end

  def create
    @lecture = MsuLecture.find(params[:msu_lecture_id])
    @presentation = @lecture.msu_presentations.build


    pdf_param = params[:msu_presentation][:pdf]
    @presentation.pdf_filename = name_the(pdf_param)

    pptx_param = params[:msu_presentation][:pptx]
    @presentation.title = pptx_param.original_filename
    @presentation.pptx_filename = name_the(pptx_param)


    if @presentation.save
      redirect_to([:admin, @lecture.msu_discipline, @lecture])
      upload([pdf_param, pptx_param])
      flash[:success] = 'Презентация загружена'
    else
      flash[:danger] = @presentation.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @presentation = MsuPresentation.find(params[:id])
    delete_files([path_to(@presentation.pdf_filename),
                  path_to(@presentation.pptx_filename)])
    if @presentation.destroy
      flash[:success] = 'Презентация удалена'
    else
      flash[:danger] = @presentation.errors.full_messages.to_sentence
    end
    redirect_back(fallback_location: [:admin, :msu_disciplines])
  end


  def upload(files)
    files.each do |file|
      File.open(path_to(file.original_filename), 'wb') do |opened|
        opened.write(file.read)
      end
    end
  end

  def delete_files(files)
    files.each do |file|
      if File.exists?(file)
        File.delete(file)
      end
    end
  end

  def path_to(filename)
    Rails.root.join('public/pdfjs/msu_presentations', filename)
  end

  def name_the(file)
    ext = File.extname(file.original_filename)
    ext[0] = ''
    file.original_filename = random_string + ext + '.' + ext         #unique filename
  end

  private

    # def presentation_params
    #   params.require(:msu_presentation).permit(:title,
    #                                            :visible)
    # end


  protected

    def random_string
      @string ||= "#{SecureRandom.urlsafe_base64}"
    end
end
