class AddColumnCidToChemicals < ActiveRecord::Migration[5.2]
  def change
    add_column :chemicals, :cid, :integer, null: false, default: 0
  end
end
