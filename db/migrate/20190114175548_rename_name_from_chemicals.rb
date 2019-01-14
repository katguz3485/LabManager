class RenameNameFromChemicals < ActiveRecord::Migration[5.2]

    def change
      rename_column :chemicals, :name, :chemical_name
      rename_column :chemicals, :image, :formula_picture
      rename_column :chemicals, :smiles, :canonical_smiles
      rename_column :chemicals, :inchi, :inchi_key
    end

end
