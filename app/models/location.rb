# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to :item

  validates :room,:shelf, :number, presence: true, uniqueness: { case_sensitive: false }

end
