require "spec_helper"

describe PhotosController, :authenticated => true do
  let(:user) { @_current_user }
  let(:photo_store) { PhotoStore.make!(:user => user) }

  before do
    bootstrap_fog_mock(photo_store)
  end

  describe "POST to :create" do
    it "uploads jpeg to S3 and creates local record" do
      post :create, :photo => {:file => uploaded_file("jonmagic.jpg", "image/jpeg")}

      photo = user.photos.first
      expect(photo).to be_present
      expect(photo.checksum).to eq("8079bd4fd6d99b2a9891763df1a4cda9")
      expect(photo.path).to eq("2013/12/2/8079bd4fd6d99b2a9891763df1a4cda9.jpg")
      expect(photo.photo_store).to eq(photo_store)

      uploaded_photo = photo_store.folder.files.get(photo.path)
      expect(uploaded_photo).to be_present
      expect(uploaded_photo).to be_instance_of(Fog::Storage::AWS::File)
    end

    it "uploads png to S3 and creates local record" do
      post :create, :photo => {:file => uploaded_file("jonmagic.png", "image/png")}

      photo = user.photos.first
      expect(photo).to be_present
      expect(photo.checksum).to eq("2796cc91eeee95410b600ae7c12952bc")
      expect(photo.path).to eq("2013/12/22/2796cc91eeee95410b600ae7c12952bc.png")
      expect(photo.photo_store).to eq(photo_store)

      uploaded_photo = photo_store.folder.files.get(photo.path)
      expect(uploaded_photo).to be_present
      expect(uploaded_photo).to be_instance_of(Fog::Storage::AWS::File)
    end

    it "uploads tiff to S3 and creates local record" do
      post :create, :photo => {:file => uploaded_file("johndbritton.tiff", "image/tiff")}

      photo = user.photos.first
      expect(photo).to be_present
      expect(photo.checksum).to eq("b2816cd510693da11786a9a8827d9254")
      expect(photo.path).to eq("2013/8/24/b2816cd510693da11786a9a8827d9254.tiff")
      expect(photo.photo_store).to eq(photo_store)

      uploaded_photo = photo_store.folder.files.get(photo.path)
      expect(uploaded_photo).to be_present
      expect(uploaded_photo).to be_instance_of(Fog::Storage::AWS::File)
    end
  end
end
