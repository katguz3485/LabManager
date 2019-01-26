class RemoveColumnUserIdFromChemicals < ActiveRecord::Migration[5.2]
  def change
    remove_column :chemicals, :user_id
  end
end
