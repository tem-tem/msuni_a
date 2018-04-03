class AddTitleToDisciplines < ActiveRecord::Migration[5.1]
  def change
    add_column :disciplines, :title, :string
  end
end
