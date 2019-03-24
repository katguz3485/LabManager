class AddNotNullAndDefaultsToItemsColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :item_owner, false
    change_column_null :items, :amount, false
    change_column_null :items, :quantity, false
    change_column_null :items, :comment, false
    change_column_null :items, :daily_usage, false
    change_column_null :items, :present_in_respiratory_zone, false
    change_column_null :items, :room, false
    change_column_null :items, :shelf, false
    change_column_null :items, :number, false
    change_column_default :items, :item_owner, from: nil,
                          to: ""
    change_column_default :items, :amount, from: nil,
                          to: 0.0
    change_column_default :items, :comment, from: nil,
                          to: ""
    change_column_default :items, :daily_usage, from: nil,
                          to: ""
    change_column_default :items, :quantity, from: nil,
                          to: ""
    change_column_default :items, :room, from: nil,
                          to: ""
    change_column_default :items, :shelf, from: nil,
                          to: ""
    change_column_default :items, :number, from: nil,
                          to: ""



  end
end

