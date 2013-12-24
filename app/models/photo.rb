class Photo < ActiveRecord::Base

  ExtensionsByContentType = {
    "image/jpeg" => ".jpg",
    "image/png"  => ".png",
    "image/tiff" => ".tiff"
  }

  # Public: Photo title.
  # column :title

  # Public: Photo description.
  # column :description

  # Public: Original filename.
  # column :filename
  validates_presence_of :filename

  # Public: User photo belongs to.
  # column :user_id
  validates_presence_of :user_id
  belongs_to :user

  # Public: PhotoStore that is storing this photo.
  # column :photo_store_id
  validates_presence_of :photo_store_id
  belongs_to :photo_store

  # Public: Path of photo on photo store (S3 file key).
  # column :path
  validates_presence_of :path
  validates_uniqueness_of :path, :scope => :photo_store_id

  # Public: Photo checksum, calculated using md5sum.
  # column :checksum
  validates_presence_of :checksum
  validates_uniqueness_of :checksum, :scope => :user_id

  # Public: Set attributes from uploaded file.
  #
  # uploaded_file - ActionDispatch::Http::UploadedFile instance.
  def uploaded_file=(uploaded_file)
    upload = photo_store.upload(uploaded_file.path, extension(uploaded_file))

    self.filename   = ::Utf8.force_encoding(uploaded_file.original_filename)
    self.checksum   = upload.checksum
    self.path       = upload.path
  end

  # Public: Extension for uploaded file.
  #
  # uploaded_file - ActionDispatch::Http::UploadedFile instance.
  #
  # Returns a String.
  def extension(uploaded_file)
    ExtensionsByContentType[uploaded_file.content_type]
  end

  # Public: The public url or a secure expiring url for the photo.
  #
  # Returns a String.
  def url
    secure_url
  end

  # Public: Persisted photo object from Fog.
  #
  # Returns a Fog::Storage::AWS::File.
  def persisted_photo
    photo_store.folder.files.get(path)
  end

  # Public: The secure expiring url for the photo.
  #
  # expires_at - Time in the future to expire the url.
  #
  # Returns a String.
  def secure_url(expires_at=1.minute.from_now)
    photo_store.secure_url(path, expires_at)
  end
end
