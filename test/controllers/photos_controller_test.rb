require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  def setup
    sign_in users(:jonmagic)
  end

  test "POST to :create uploads jpeg to S3 and creates local record" do
    post :create, :photo => {:file => uploaded_file("jonmagic.jpg", "image/jpeg")}

    photo = Photo.last
    assert photo
    assert_equal "8079bd4fd6d99b2a9891763df1a4cda9", photo.checksum
    assert_equal "2013/12/2/8079bd4fd6d99b2a9891763df1a4cda9.jpg", photo.path

    photo_store = photo_stores(:aws)
    assert_equal photo_store, photo.photo_store

    uploaded_photo = photo_store.folder.files.get(photo.path)
    assert uploaded_photo
    assert_instance_of Fog::Storage::AWS::File, uploaded_photo
  end

  test "POST to :create uploads png to S3 and creates local record" do
    post :create, :photo => {:file => uploaded_file("jonmagic.png", "image/png")}

    photo = Photo.last
    assert photo
    assert_equal "2796cc91eeee95410b600ae7c12952bc", photo.checksum
    assert_match /2796cc91eeee95410b600ae7c12952bc\.png/, photo.path

    photo_store = photo_stores(:aws)
    assert_equal photo_store, photo.photo_store

    uploaded_photo = photo_store.folder.files.get(photo.path)
    assert uploaded_photo
    assert_instance_of Fog::Storage::AWS::File, uploaded_photo
  end

  test "POST to :create uploads tiff to S3 and creates local record" do
    post :create, :photo => {:file => uploaded_file("johndbritton.tiff", "image/tiff")}

    photo = Photo.last
    assert photo
    assert_equal "b2816cd510693da11786a9a8827d9254", photo.checksum
    assert_match /b2816cd510693da11786a9a8827d9254\.tiff/, photo.path

    photo_store = photo_stores(:aws)
    assert_equal photo_store, photo.photo_store

    uploaded_photo = photo_store.folder.files.get(photo.path)
    assert uploaded_photo
    assert_instance_of Fog::Storage::AWS::File, uploaded_photo
  end
end
