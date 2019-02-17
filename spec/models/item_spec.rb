# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of :item_owner }
    it { should  validate_presence_of :quantity }
    it { should  validate_presence_of :amount }
  end

  describe 'associations' do
    it { should  belong_to :chemical }
  end

  describe 'database_columns' do
    it { should  have_db_column :item_owner }
    it { should  have_db_column :quantity }
    it { should  have_db_column :amount }
    it { should  have_db_column :comment }
    it { should  have_db_column :daily_usage }
    it { should  have_db_column :present_in_respiratory_zone }
    it { should  have_db_column :chemical_id }
    it { should  have_db_column :created_at }
    it { should  have_db_column :updated_at }
  end
end
