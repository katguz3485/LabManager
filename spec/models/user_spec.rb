# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(
        username: 'kasia',
        email: 'emailkasi@gmail.com',
        password: 'safepassword',
        provider: provider,
        uid: '',
        avatar: avatar,
    )
  end

  let(:provider) {''}
  let(:avatar) {'http://github.com/fake-avatar'}

  it {is_expected.to have_many(:user_providers)}
  it {should validate_uniqueness_of(:email).ignoring_case_sensitivity}


  describe 'database_columns' do
    it {is_expected.to have_db_column :email}
    it {is_expected.to have_db_column :encrypted_password}
    it {is_expected.to have_db_column :reset_password_token}
    it {is_expected.to have_db_column :reset_password_sent_at}
    it {is_expected.to have_db_column :remember_created_at}
    it {is_expected.to have_db_column :sign_in_count}
    it {is_expected.to have_db_column :current_sign_in_at}
    it {is_expected.to have_db_column :last_sign_in_at}
    it {is_expected.to have_db_column :last_sign_in_ip}
    it {is_expected.to have_db_column :current_sign_in_ip}
    it {is_expected.to have_db_column :created_at}
    it {is_expected.to have_db_column :updated_at}
    it {is_expected.to have_db_column :provider}
    it {is_expected.to have_db_column :uid}
    it {is_expected.to have_db_column :username}
    it {is_expected.to have_db_column :avatar}
  end


end
