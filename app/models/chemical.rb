# frozen_string_literal: true

class Chemical < ApplicationRecord

  belongs_to :category, required: false

  validates :chemical_name, presence: true, uniqueness: true


end
