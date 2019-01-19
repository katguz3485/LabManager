# frozen_string_literal: true

class Chemical < ApplicationRecord

  belongs_to :category, required: false
  has_one :safety_precaution
  has_many :items, through: :places

  validates :chemical_name, presence: true, uniqueness: {case_sensitive: false}
end
