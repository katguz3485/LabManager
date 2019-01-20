# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do

  describe 'validations' do
    it {is_expected.to validate_presence_of :item_owner}
    it {is_expected.to validate_presence_of :quantity}
    it {is_expected.to validate_presence_of :amount}
  end

  describe 'associations' do
    it {is_expected.to have_many :locations}
    it {is_expected.to belong_to :chemical}
  end

  describe 'database_columns' do
    it {is_expected.to have_db_column :item_owner}
    it {is_expected.to have_db_column :quantity}
    it {is_expected.to have_db_column :amount}
    it {is_expected.to have_db_column :comment}
    it {is_expected.to have_db_column :daily_usage}
    it {is_expected.to have_db_column :present_in_respiratory_zone}
    it {is_expected.to have_db_column :chemical_id}
    it {is_expected.to have_db_column :created_at}
    it {is_expected.to have_db_column :updated_at}
  end
end


