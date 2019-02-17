class AddNullToCategories < ActiveRecord::Migration[5.2]
  def change
    change_column_null :categories, :category_name, false
    add_timestamps(:categories, null: false)
  end
end
