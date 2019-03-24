class AddNotNullAndDefaultsToSafetyPrecautions < ActiveRecord::Migration[5.2]
  def change
    change_column_null :safety_precautions, :sds_file, false
    change_column_null :safety_precautions, :name_from_sds, false
    change_column_null :safety_precautions, :pictogram, false
    change_column_null :safety_precautions, :storage_temperature_range, false
    change_column_null :safety_precautions, :signal_word, false
    change_column_null :safety_precautions, :h_codes, false
    change_column_null :safety_precautions, :h_statements, false
    change_column_null :safety_precautions, :p_codes, false
    change_column_null :safety_precautions, :p_statements, false
    change_column_null :safety_precautions, :adr_number, false
    change_column_null :safety_precautions, :adr_class, false
    change_column_null :safety_precautions, :adr_group, false
    change_column_default :safety_precautions, :sds_file, from: nil,
                          to: ""
    change_column_default :safety_precautions, :name_from_sds, from: nil,
                          to: ""
    change_column_default :safety_precautions, :pictogram, from: nil,
                          to: ""
    change_column_default :safety_precautions, :storage_temperature_range, from: nil,
                          to: ""
    change_column_default :safety_precautions, :signal_word, from: nil,
                          to: ""
    change_column_default :safety_precautions, :h_codes, from: nil,
                          to: ""
    change_column_default :safety_precautions, :h_statements, from: nil,
                          to: ""
    change_column_default :safety_precautions, :p_statements, from: nil,
                          to: ""
    change_column_default :safety_precautions, :p_codes, from: nil,
                          to: ""
    change_column_default :safety_precautions, :adr_number, from: nil,
                          to: ""
    change_column_default :safety_precautions, :adr_class, from: nil,
                          to: ""
    change_column_default :safety_precautions, :adr_group, from: nil,
                          to: ""




  end

end
