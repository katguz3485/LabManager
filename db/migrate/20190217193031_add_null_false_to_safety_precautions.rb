class AddNullFalseToSafetyPrecautions < ActiveRecord::Migration[5.2]
  def change
    change_column_null :safety_precautions, :sds_file, null: false
    change_column_null :safety_precautions, :name_from_sds, null: false
    change_column_null :safety_precautions, :pictogram, null: false
    change_column_null :safety_precautions, :h_codes, null: false
    change_column_null :safety_precautions, :h_statements, null: false
    change_column_null :safety_precautions, :p_codes, null: false
    change_column_null :safety_precautions, :p_statements, null: false
  end

end
