# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryDecorator do
  let(:category) { create :category, category_name: 'carboxylic acids' }
  let(:chemical) { create :chemical }

  describe '.titleize_category_name' do
    subject { category.decorate.titleize_category_name }
    it { is_expected.to eq 'Carboxylic Acids' }
  end
end
