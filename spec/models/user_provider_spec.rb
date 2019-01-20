# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserProvider, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'database_columns' do
    it { should have_db_column :user_id }
    it { should have_db_column :provider }
    it { should have_db_column :uid }
  end

  describe '.find_user' do
    subject { UserProvider.find_user(auth) }

    let(:auth) { double('Auth') }
    let(:user_provider_finder) { double('UserProviderFinder', user: user) }
    let(:user) { double('User') }

    before do
      allow(OmniauthProviders::Finder).to receive(:find).with(auth)
        .and_return(user_provider_finder)
    end

    it 'returns the user who owns the user provider' do
      expect(subject).to eql(user)
    end
  end
end
