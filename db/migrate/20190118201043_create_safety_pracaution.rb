class CreateSafetyPracaution < ActiveRecord::Migration[5.2]
  def change
    create_table :safety_pracautions do |t|
      t.string :sds_file
      t.string :name_from_sds
      t.string :pictogram
      t.string :storage_temperature_range
      t.string :signal_word
      t.string :h_codes
      t.string :h_statements
      t.string :p_codes
      t.string :p_statements
      t.string :adr_number
      t.string :adr_class
      t.string :adr_group
      t.bigint "chemical_id"
      t.timestamps
      t.index ["chemical_id"], name: "index_safety_pracautions_on_chemical_id"
    end
  end
end
