class AddUserIdColumnToChemicals < ActiveRecord::Migration[5.2]
  def change
    add_column :chemicals, :user_id, :integer
  end
end
