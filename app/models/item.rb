# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :chemical
  has_many :locations
end
