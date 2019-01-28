# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :category_name }
    it { should validate_uniqueness_of(:category_name).case_insensitive }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { is_expected.to have_many :chemicals }
  end

  describe 'database_columns' do
    it { is_expected.to have_db_column :category_name }
    it { is_expected.to have_db_column :user_id }
  end
end
