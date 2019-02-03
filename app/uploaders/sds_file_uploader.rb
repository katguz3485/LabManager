# frozen_string_literal: true

class SdsFileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def fog_directory
    Rails.application.credentials.dig(:aws, :bucket_msds)
  end

  def extension_whitelist
    %w(pdf)
  end

  def size_range
    0.1..5.megabytes
  end
end
