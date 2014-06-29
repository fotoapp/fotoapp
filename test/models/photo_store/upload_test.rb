require 'test_helper'

class PhotoStoreUploadTest < ActiveSupport::TestCase
  def setup
    @photo_store = photo_stores(:aws)
    @folder      = bootstrap_fog_mock(@photo_store).folder
  end

  def public_upload
    photo_path = path_to_fixture "jonmagic.jpg"
    PhotoStore::Upload.new(@folder, photo_path, :public? => true)
  end

  test "#public? defaults to false" do
    photo_path = path_to_fixture "jonmagic.jpg"
    upload     = PhotoStore::Upload.new(@folder, photo_path)

    refute upload.public?
  end

  test "#public? uses value from options if present" do
    assert public_upload.public?
  end

  test "#checksum defaults to false" do
    assert_equal "8079bd4fd6d99b2a9891763df1a4cda9", public_upload.checksum
  end

  test "#path returns path from persisted_photo" do
    assert_equal "2013/12/2/8079bd4fd6d99b2a9891763df1a4cda9.jpg", public_upload.path
  end

  test "uploads jpg using date, md5sum, and extension for path" do
    assert_equal \
      "https://foto-test.s3.amazonaws.com/2013/12/2/8079bd4fd6d99b2a9891763df1a4cda9.jpg",
      public_upload.persisted_photo.public_url

    assert_equal \
      "https://foto-test.s3.amazonaws.com/thumbnails/2013/12/2/8079bd4fd6d99b2a9891763df1a4cda9.jpg",
      public_upload.persisted_thumbnail.public_url
  end

  test "uploads png using date, md5sum, and extension for path" do
    photo_path = path_to_fixture "jonmagic.png"
    upload     = PhotoStore::Upload.new(@folder, photo_path, :public? => true)
    upload.stubs(:date_time => Time.parse("2013-12-22"))

    assert_equal \
      "https://foto-test.s3.amazonaws.com/2013/12/22/2796cc91eeee95410b600ae7c12952bc.png",
      upload.persisted_photo.public_url

    assert_equal \
      "https://foto-test.s3.amazonaws.com/thumbnails/2013/12/22/2796cc91eeee95410b600ae7c12952bc.png",
      upload.persisted_thumbnail.public_url
  end

  test "uploads tiff using date, md5sum, and extension for path" do
    photo_path = path_to_fixture "johndbritton.tiff"
    upload     = PhotoStore::Upload.new(@folder, photo_path, :public? => true)

    assert_equal \
      "https://foto-test.s3.amazonaws.com/2013/8/24/b2816cd510693da11786a9a8827d9254.tiff",
      upload.persisted_photo.public_url

    assert_equal \
      "https://foto-test.s3.amazonaws.com/thumbnails/2013/8/24/b2816cd510693da11786a9a8827d9254.tiff",
      upload.persisted_thumbnail.public_url
  end
end
