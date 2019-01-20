class ChangeSafetyPracautionsToSafetyPrecautions < ActiveRecord::Migration[5.2]
  def change
    rename_table "safety_pracautions", "safety_precautions"
  end
end
