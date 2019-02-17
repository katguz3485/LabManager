# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chemical, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:chemical) }

    it {should validate_presence_of :formula}
    it {should validate_presence_of :molecular_weight}
   # it {should validate_presence_of :chemical_name}
    it {should validate_uniqueness_of(:chemical_name).case_insensitive}

  end

  describe 'associations' do
    it {is_expected.to have_many :items}
    it {is_expected.to have_one :safety_precaution}
    it {is_expected.to belong_to :category}
    it {should belong_to(:category)}
  end

  describe 'database_columns' do
    it {is_expected.to have_db_column :chemical_name}
    it {is_expected.to have_db_column :formula}
    it {is_expected.to have_db_column :molecular_weight}
    it {is_expected.to have_db_column :density}
    it {is_expected.to have_db_column :cas_number}
    it {is_expected.to have_db_column :canonical_smiles}
    it {is_expected.to have_db_column :inchi_key}
    it {is_expected.to have_db_column :formula_picture}
    it {is_expected.to have_db_column :category_id}
    it {is_expected.to have_db_column :created_at}
  end
end
