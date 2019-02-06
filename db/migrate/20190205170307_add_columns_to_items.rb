class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :room, :string
    add_column :items, :shelf, :string
    add_column :items, :number, :string
  end
end
