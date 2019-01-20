# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SafetyPrecaution, type: :model do

  describe 'associations' do
    it {is_expected.to belong_to :chemical}
  end


  describe 'database_columns' do
    it {is_expected.to have_db_column :sds_file}
    it {is_expected.to have_db_column :name_from_sds}
    it {is_expected.to have_db_column :pictogram}
    it {is_expected.to have_db_column :storage_temperature_range}
    it {is_expected.to have_db_column :signal_word}
    it {is_expected.to have_db_column :h_codes}
    it {is_expected.to have_db_column :h_statements}
    it {is_expected.to have_db_column :p_codes}
    it {is_expected.to have_db_column :p_statements}
    it {is_expected.to have_db_column :adr_number}
    it {is_expected.to have_db_column :adr_class}
    it {is_expected.to have_db_column :adr_group}
    it {is_expected.to have_db_column :chemical_id}
    it {is_expected.to have_db_column :created_at}
    it {is_expected.to have_db_column :updated_at}
  end
end
