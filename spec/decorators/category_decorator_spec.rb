# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryDecorator do
  let(:user) do
    create :user, username: 'kasia', email: 'emailkasi@gmail.com',
                  password: 'safepassword'
  end

  let(:user_provider_finder) { double('UserProviderFinder', user: user) }
  let(:category) { create :category, category_name: 'carboxylic acids', user_id: user.id }
  let(:chemical) { create :chemical }

  describe '.titleize_category_name' do
    subject { category.decorate.titleize_category_name }
    it { is_expected.to eq 'Carboxylic Acids' }
  end
end
