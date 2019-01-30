class FormulaFileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  process resize_to_fit: [100, 100]

  version :thumb do
    process resize_to_fill: [50, 50]
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
