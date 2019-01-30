# frozen_string_literal: true

class Chemical < ApplicationRecord
  belongs_to :category
  has_one :safety_precaution
  has_many :items
  validates :chemical_name, presence: true, uniqueness: {case_sensitive: false}
  validates :formula, :cas_number, :molecular_weight, presence: true
  mount_uploader :formula_picture, FormulaFileUploader

  attr_accessor :file_download

  def file_download
    FileDownloadService.new(self).call
  end

end
