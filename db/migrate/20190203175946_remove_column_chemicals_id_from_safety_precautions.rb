class RemoveColumnChemicalsIdFromSafetyPrecautions < ActiveRecord::Migration[5.2]
  def change
    def change
      remove_column :safety_precautions, :chemicals_id
    end
  end
end
