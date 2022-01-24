class PdfUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    @fecha=Time.parse(model.updated_at.to_s)
    
    case @fecha.month 
    when 1  
      "/home/debian/Archivos/enero/"
    when 2 
      "/home/debian/Archivos/febrero/"
    when 3  
      "/home/debian/Archivos/marzo/"
    when 4 
      "/home/debian/Archivos/abril/"
    when 5  
      "/home/debian/Archivos/mayo/"
    when 6 
      "/home/debian/Archivos/junio/"
    when 7  
      "/home/debian/Archivos/julio/"
    when 8 
      "/home/debian/Archivos/agosto/"
    when 9  
      "/home/debian/Archivos/septiembre/"
    when 10 
      "/home/debian/Archivos/octubre/"
    when 11  
      "/home/debian/Archivos/noviembre/"
    else
      "/home/debian/Archivos/diciembre/"       
    end
    #uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_allowlist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
