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
      @mes='01'
    when 2
      @mes='02'
    when 3
      @mes='03'
    when 4
      @mes='04'
    when 5
      @mes='05'
    when 6
      @mes='06'
    when 7
      @mes='07'
    when 8
      @mes='08'
    when 9
      @mes='09'
    else
      @mes=@fecha.month    
    end

    #"/mnt/servidor_local/ArchivosControlDocumental/#{@fecha.year}/#{@mes}"
    #uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    "/mnt/respaldos/ArchivosControlDocumental/#{@fecha.year}/#{@mes}"
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
