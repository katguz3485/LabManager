# frozen_string_literal: true

class Chemical < ApplicationRecord
  belongs_to :category
  has_one :safety_precaution
  has_many :items
  validates :chemical_name, presence: true, uniqueness: {case_sensitive: false}
  validates :formula, :cas_number, :molecular_weight, presence: true
  mount_uploader :formula_picture, FormulaFileUploader

  attr_accessor :file_download, :process_original_version


  def file_download
    FileDownloadService.new(self).call
  end
=begin

  def process_original_version
    image = ::MiniMagick::Image::read(@chemical.formula_picture)

    if image[:width] > image[:height]
      resize_to_fill 50, 50
    else
      resize_to_fill 50, 50
    end
  end
=end




end
