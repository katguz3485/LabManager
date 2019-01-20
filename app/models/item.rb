# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :chemical
  has_many :locations

  validates :item_owner, :quantity, :amount, presence: true


end
