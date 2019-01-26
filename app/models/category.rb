# frozen_string_literal: true

class Category < ApplicationRecord

  belongs_to :user
  has_many :chemicals

  validates :category_name, presence: true, uniqueness: { case_sensitive: false }
end
