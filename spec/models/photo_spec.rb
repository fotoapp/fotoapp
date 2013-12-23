require 'spec_helper'

describe Photo do
  let(:photo_store) { PhotoStore.make! }
  let(:user) { photo_store.user }

  describe "User and checksum" do
    it "must be unique" do
      attributes = {
        :user     => user,
        :checksum => SecureRandom.hex
      }

      Photo.make!(attributes)

      expect { Photo.make!(attributes) }.to \
        raise_error(ActiveRecord::RecordInvalid,
          "Validation failed: Checksum has already been taken")
    end
  end

  describe "PhotoStore and path" do
    it "must be unique" do
      attributes = {
        :photo_store => photo_store,
        :path        => "path/to/image.jpg"
      }

      Photo.make!(attributes)

      expect { Photo.make!(attributes) }.to \
        raise_error(ActiveRecord::RecordInvalid,
          "Validation failed: Path has already been taken")
    end
  end
end
