class RemoveColumnCsidFromChemicals < ActiveRecord::Migration[5.2]
  def change
    remove_column :chemicals, :csid
  end
end
