class AddPptxFilenameToMsuPresentation < ActiveRecord::Migration[5.1]
  def change
    add_column :msu_presentations, :pptx_filename, :string
    rename_column :msu_presentations, :filename, :pdf_filename
  end
end
