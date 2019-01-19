# frozen_string_literal: true

class Chemical < ApplicationRecord
  belongs_to :category, optional: true
  has_one :safety_precaution
  has_many :items
  validates :chemical_name, presence: true, uniqueness: { case_sensitive: false }
end
