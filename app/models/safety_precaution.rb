# frozen_string_literal: true

class SafetyPrecaution < ApplicationRecord
  belongs_to :chemical

  mount_uploader :sds_file, SdsFileUploader

  def download_msds
    MsdsDownloadService.new(self).call
  end
end
