# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :room }
    it { is_expected.to validate_presence_of :shelf }
    it { is_expected.to validate_presence_of :number }
    it { should validate_uniqueness_of(:room).case_insensitive }
    it { should validate_uniqueness_of(:shelf).case_insensitive }
    it { should validate_uniqueness_of(:number).case_insensitive }
  end

  describe 'associations' do
    it { is_expected.to belong_to :item }
  end

  describe 'database_columns' do
    it { is_expected.to have_db_column :room }
    it { is_expected.to have_db_column :shelf }
    it { is_expected.to have_db_column :number }
    it { is_expected.to have_db_column :item_id }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end
end
