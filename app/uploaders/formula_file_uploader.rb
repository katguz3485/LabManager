class FormulaFileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  process resize_to_fit: [100, 100]

  version :thumb do
    process resize_to_fit: [250, 250]
  end

  def fog_directory
    Rails.application.credentials.dig(:aws, :bucket_formula)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def size_range
    0.1..5.megabytes
  end



end
