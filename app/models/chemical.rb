# frozen_string_literal: true

class Chemical < ApplicationRecord
  belongs_to :category
  has_one :safety_precaution
  has_many :items
  accepts_nested_attributes_for :safety_precaution, allow_destroy: true
  validates :chemical_name, presence: true, uniqueness: {case_sensitive: false}
  validates :formula, :cas_number, :molecular_weight, presence: true
  mount_uploader :formula_picture, FormulaFileUploader

  attr_accessor  :process_original_version




end
