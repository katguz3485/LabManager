# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  let(:user_signed_in?) {true}
  let(:user) { FactoryBot.create(:user) }
  let(:auth) { OmniAuth.config.mock_auth[:github] }
  let(:persisted) { true }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = auth

    allow(UserProvider).to receive(:find_user).with(auth).and_return(user)
    allow(user).to receive(:persisted?).and_return(persisted)

  end




end
