require 'test_helper'

class PhotoStoreTest < ActiveSupport::TestCase
  test "#folder returns an instance of Fog::Storage::AWS::Directory" do
    photo_store = photo_stores(:aws)
    bootstrap_fog_mock(photo_store)

    assert_instance_of Fog::Storage::AWS::Directory, photo_store.folder
  end

  test "#connection returns a Fog::Storage::AWS instance" do
    photo_store = photo_stores(:aws)

    assert_instance_of Fog::Storage::AWS::Mock, photo_store.connection
  end
end
