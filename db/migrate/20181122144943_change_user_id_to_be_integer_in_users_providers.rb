class ChangeUserIdToBeIntegerInUsersProviders < ActiveRecord::Migration[5.2]
  def change
    change_column :user_providers, :user_id, :integer
  end
end
