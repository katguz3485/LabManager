# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:github, :google, :facebook]

  has_many :user_providers, dependent: :destroy

  validates :email, uniqueness: true


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


  def update_avatar(avatar)
    update!(avatar: avatar)
  end
end
