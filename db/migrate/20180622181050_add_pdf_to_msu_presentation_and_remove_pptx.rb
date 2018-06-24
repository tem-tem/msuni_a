class AddPdfToMsuPresentationAndRemovePptx < ActiveRecord::Migration[5.1]
  def change
    remove_column :msu_presentations, :pdf_filename
    remove_column :msu_presentations, :pptx_filename
    add_column :msu_presentations, :pdf, :string
  end
end
