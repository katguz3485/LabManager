class CreateChemical < ActiveRecord::Migration[5.2]
  def change
    create_table :chemicals do |t|
      t.string :name
      t.string :formula
      t.float :molecular_weight
      t.float :density
      t.string :cas_number
      t.integer :csid
      t.string :smiles
      t.string :inchi
      t.integer :user_id
      t.string :image
      t.timestamps

    end
  end
end
