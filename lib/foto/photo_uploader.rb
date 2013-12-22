module Foto
  class PhotoUploader

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
