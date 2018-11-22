class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  has_many :user_providers, dependent: :destroy



  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end


=begin
  def self.from_omniauth(auth)
    where(provider: auth.provider, facebook_uid: auth.facebook_uid).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.facebook_uid = auth.facebook_uid
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.from_omniauth(auth)
    data = auth.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(
          email: data['email'],
          password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
=end

end
