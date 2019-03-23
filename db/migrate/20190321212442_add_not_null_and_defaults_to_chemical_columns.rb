class AddNotNullAndDefaultsToChemicalColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null :chemicals, :molecular_weight, false
    change_column_null :chemicals, :density, false
    change_column_null :chemicals, :cas_number, false
    change_column_null :chemicals, :canonical_smiles, false
    change_column_null :chemicals, :inchi_key, false
    change_column_null :chemicals, :formula_picture, null: false
    change_column_default :chemicals, :molecular_weight, from: nil,
                          to: ""
    change_column_default :chemicals, :density, from: nil,
                          to: 0.0
    change_column_default :chemicals, :cas_number, from: nil,
                          to: ""
    change_column_default :chemicals, :canonical_smiles, from: nil,
                          to: ""
    change_column_default :chemicals, :inchi_key, from: nil,
                          to: ""
    change_column_default :chemicals, :formula_picture, from: nil,
                          to: ""
  end
end
