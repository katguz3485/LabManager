class AddNullToChemicals < ActiveRecord::Migration[5.2]
  def change
    change_column_null :chemicals, :chemical_name, false
    change_column_null :chemicals, :formula, false
    change_column_null :chemicals,:molecular_weight, null: false
    change_column_null :chemicals, :cas_number, null: false
    change_column_null  :chemicals, :canonical_smiles, null: false
    change_column_null  :chemicals, :density, null: false, default: 0
    change_column_null :chemicals, :created_at, null: false
    change_column_null :chemicals, :updated_at, null: false
    change_column_null :chemicals, :formula_picture, null: false
    change_column_null :chemicals, :inchi_key, null: false
  end






end

