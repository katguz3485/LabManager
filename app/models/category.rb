# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :user
  has_many :chemicals
  before_validation :normalize_category_name, on: :create
  validates :category_name, presence: true, uniqueness: { case_sensitive: false }

  private

  def normalize_category_name
    self.category_name = category_name.downcase.titleize
  end
end
