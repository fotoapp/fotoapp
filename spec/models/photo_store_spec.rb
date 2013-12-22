require 'spec_helper'

describe PhotoStore do
  let(:photo_store) { PhotoStore.make! }

  describe "#directory" do
    it "returns an instance of Fog::Storage::AWS::Directory" do
      photo_store.connection.directories.create(:key => photo_store.folder_name)

      expect(photo_store.directory).to be_instance_of(Fog::Storage::AWS::Directory)
    end
  end

  describe "#connection" do
    it "returns a Fog::Storage::AWS instance" do
      expect(photo_store.connection).to be_instance_of(Fog::Storage::AWS::Mock)
    end
  end
end
