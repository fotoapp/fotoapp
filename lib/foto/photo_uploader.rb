module Foto
  class PhotoUploader
    # PhotoUploader uploads a photo to a folder.
    #
    # It uses the created at date, read from the photo Exif data, to calculate
    # the sub folder path, and then the md5sum of the photo for the photo
    # filename, along with the photo file extension. It uploads the photo to
    # this path in the supplied Fog folder.
    #
    # It accepts an options hash as well, allowing you to send :public? => true
    # which will give the file a permanent, and public, url.
    #
    # Example Usage:
    #
    # => photo_store = PhotoStore.first
    # => photo_path = Rails.root.join("spec", "fixtures", "jonmagic.jpg")
    # => uploader = Foto::PhotoUploader.new(photo_store.folder, photo_path, :public? => true)
    # => file = uploader.upload
    # => file.public_url

    def initialize(folder, photo_path, options=nil)
      @folder     = folder
      @photo_path = photo_path
      options     = options || {}
      @public     = options.fetch(:public?) { false }
    end

    attr_reader :folder, :photo_path

    # Public: Is this image public?
    #
    # Returns a TrueClass or FalseClass.
    def public?
      !!@public
    end

    # Public: Uploads file and returns url.
    #
    # Returns a Fog::Storage::AWS::File.
    def upload
      folder.files.create({
        :key => "#{year}/#{month}/#{day}/#{md5}#{extension}",
        :body => File.open(photo_path),
        :public => public?
      })
    end

    private

    # Internal: Year photo was created.
    #
    # Returns an Integer.
    def year
      date_time.year
    end

    # Internal: Month photo was created.
    #
    # Returns an Integer.
    def month
      date_time.month
    end

    # Internal: Day of month photo was created.
    #
    # Returns an Integer.
    def day
      date_time.day
    end

    # Internal: The md5sum of the photo.
    #
    # Returns a String.
    def md5
      Digest::MD5.hexdigest(File.read(photo_path))
    end

    # Internal: The photo file extension (jpg, png, ...).
    #
    # Returns a String.
    def extension
      File.extname(photo_path)
    end

    def date_time
      @date_time ||= exif["DateTimeOriginal"] || exif["FileModifyDate"]
    end

    # Internal: The exif data for the photo.
    #
    # Returns a EXIFR::JPEG.
    def exif
      @exif ||= MiniExiftool.new(photo_path.to_s).to_hash
    end
  end
end
