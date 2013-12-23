require 'spec_helper'

describe PhotoStore do
  let(:photo_store) { PhotoStore.make! }

  describe "#folder" do
    it "returns an instance of Fog::Storage::AWS::Directory" do
      bootstrap_fog_mock(photo_store)

      expect(photo_store.folder).to be_instance_of(Fog::Storage::AWS::Directory)
    end
  end

  describe "#connection" do
    it "returns a Fog::Storage::AWS instance" do
      expect(photo_store.connection).to be_instance_of(Fog::Storage::AWS::Mock)
    end
  end
end
