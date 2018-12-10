class AddColumnImageToChemicals < ActiveRecord::Migration[5.2]
  def change
    add_column :chemicals, :image, :string
  end
end
