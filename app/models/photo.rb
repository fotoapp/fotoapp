class Photo < ActiveRecord::Base
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
end
