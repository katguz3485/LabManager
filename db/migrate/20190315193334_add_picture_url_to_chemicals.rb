class AddPictureUrlToChemicals < ActiveRecord::Migration[5.2]
  def change
    add_column :chemicals, :picture_url, :string, null: false, default: ""
  end
end
