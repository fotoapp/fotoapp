class Thumbnail
  def initialize(photo_path)
    @photo_path = photo_path.to_s
  end

  attr_reader :photo_path

  # Public: Shells out to imagemagick to create a thumbnail.
  #
  # Returns a String.
  def generate
    `convert #{photo_path} -thumbnail 512x512^ -gravity center -extent 512x512 #{thumbnail_path}`

    thumbnail_path
  end

  # Public: Path to thumbnail.
  #
  # Returns a String.
  def thumbnail_path
    "#{File.dirname(photo_path)}/#{File.basename(photo_path)}-preview"
  end
end
