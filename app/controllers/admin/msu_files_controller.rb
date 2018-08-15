class Admin::MsuFilesController < ApplicationController

  def new
    @discipline = MsuDiscipline.find(params[:msu_discipline_id])
    @file = @discipline.msu_files.build()
    respond_to do |f|
      f.js
    end
  end

  def create
    @discipline = MsuDiscipline.find(params[:msu_discipline_id])
    @file = @discipline.msu_files.build(file_params)
    if @file.save
      redirect_to [:admin, @discipline, anchor: 'nav-books']
    else
      flash.now[:danger] = @file.errors.full_messages.to_sentence
      params[:filetype] = @file.filetype
      render :new
    end
  end

  def edit
    @file = MsuFile.find(params[:id])
    @discipline = @file.msu_discipline
    params[:filetype] = @file.filetype
    respond_to do |f|
      f.js
    end
  end

  def update
    @file = MsuFile.find(params[:id])
    @discipline = @file.msu_discipline
    params[:filetype] = @file.filetype
    @file.update(file_params)

    if @file.save
      redirect_to [:admin, @discipline, anchor: 'nav-books']
    else
      respond_to do |f|
        f.js
        flash.now[:danger] = @file.errors.full_messages.to_sentence
        render :edit
      end
    end
  end

  def destroy
    file = MsuFile.find(params[:id])
    discipline = file.msu_discipline
    name = file.name
    if file.destroy
      flash[:success] = name + ' удален'
    else
      flash[:danger] = file.errors.full_messages.to_sentence
    end
    redirect_to [:admin, discipline, anchor: 'nav-books']
  end

  private

    def file_params
      params.require(:msu_file).permit(:name, :filetype, :file, :link)
    end
end
