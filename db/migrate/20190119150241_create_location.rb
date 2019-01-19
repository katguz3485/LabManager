class CreateLocation < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :room
      t.string :shelf
      t.string :number
      t.bigint "item_id"
      t.timestamps
      t.index ["item_id"], name: "index_locations_on_item_id"
    end
  end
end
