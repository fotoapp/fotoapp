require 'spec_helper'

describe Photo do
  describe "User and checksum" do
    it "must be unique" do
      attributes = {
        :user     => User.make!,
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
        :photo_store => PhotoStore.make!,
        :path        => "path/to/image.jpg"
      }

      Photo.make!(attributes)

      expect { Photo.make!(attributes) }.to \
        raise_error(ActiveRecord::RecordInvalid,
          "Validation failed: Path has already been taken")
    end
  end
end
