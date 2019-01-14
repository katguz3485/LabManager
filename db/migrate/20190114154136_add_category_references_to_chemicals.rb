class AddCategoryReferencesToChemicals < ActiveRecord::Migration[5.2]
  def change
    add_reference :chemicals, :category, foreign_key: true
  end
end
