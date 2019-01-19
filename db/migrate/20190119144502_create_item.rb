class CreateItem < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_owner
      t.integer :quantity
      t.float :amount
      t.string :comment
      t.string :daily_usage
      t.boolean  :present_in_respiratory_zone, :default => false
      t.bigint "chemical_id"
      t.timestamps
      t.index ["chemical_id"], name: "index_items_on_chemical_id"
    end
  end
end
