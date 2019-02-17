class AddNullToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :item_owner, null: false
    change_column_null :items, :quantity, null: false, default: 0
    change_column_null :items, :amount, null: false, default: 0.0
    change_column_null :items, :comment, null: false
    change_column_null :items, :daily_usage, null: false
    change_column_null :items, :present_in_respiratory_zone, null: false, default: false
    change_column_null :items, :room, null: false
    change_column_null :items, :shelf, null: false
    change_column_null :items, :number, null: false
  end
end
