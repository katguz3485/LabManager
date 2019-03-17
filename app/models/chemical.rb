# frozen_string_literal: true

class Chemical < ApplicationRecord
  include ActiveModel::Validations
  validates_with CasNumberValidator

  before_validation :normalize_chemical_name, on: :create
  belongs_to :category, optional: true
  has_one :safety_precaution, dependent: :destroy
  has_many :items
  accepts_nested_attributes_for :safety_precaution, allow_destroy: true
  validates :chemical_name, presence: { message: 'Please provide IUPAC name of compound' },
            uniqueness: { case_sensitive: false }, unless: :skip_name_validation
  validates :molecular_weight, presence: true
  validates :cas_number, presence: { message: 'Provide cas number in format with hyphens' }

  mount_uploader :formula_picture, FormulaFileUploader

  attr_accessor :process_original_version
  attr_accessor :skip_name_validation, :skip_mw_formula_validation

  private

  def normalize_chemical_name
    self.chemical_name = chemical_name.downcase.titleize unless chemical_name.nil?
  end




end
