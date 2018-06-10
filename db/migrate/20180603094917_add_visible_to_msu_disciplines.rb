class AddVisibleToMsuDisciplines < ActiveRecord::Migration[5.1]
  def change
    add_column :msu_disciplines, :visible, :boolean, default: true
  end
end
