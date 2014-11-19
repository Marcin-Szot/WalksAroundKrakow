# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
   include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

   version :thumb do
     process :resize_to_limit => [300,200], :if => :is_horizontal?
     process :resize_to_limit => [200,250], :if => :is_vertical?
   end

   def is_vertical? picture
     image = ::MiniMagick::Image.open(picture.path)
     image[:width] < image[:height]
   end

   def is_horizontal? picture
      image = ::MiniMagick::Image.open(picture.path)
      image[:width] > image[:height]
   end

end
