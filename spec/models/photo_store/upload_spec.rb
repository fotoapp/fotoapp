require "spec_helper"

describe PhotoStore::Upload do
  let(:photo_path) { path_to_fixture "jonmagic.jpg" }
  let(:photo_store) { PhotoStore.make! :folder_name => "foto-test" }
  let(:folder) { bootstrap_fog_mock(photo_store).folder }
  let(:upload) { PhotoStore::Upload.new(folder, photo_path, {:public? => true}) }

  describe "#public?" do
    it "defaults to false" do
      upload = PhotoStore::Upload.new(folder, photo_path)

      expect(upload).to_not be_public
    end

    it "uses value from options if present" do
      upload = PhotoStore::Upload.new(folder, photo_path, {:public? => true})

      expect(upload).to be_public
    end
  end

  describe "#checksum" do
    it "defaults to false" do
      expect(upload.checksum).to eq("8079bd4fd6d99b2a9891763df1a4cda9")
    end
  end

  describe "#path" do
    it "returns path from persisted_photo" do
      expect(upload.path).to eq("2013/12/2/8079bd4fd6d99b2a9891763df1a4cda9.jpg")
    end
  end

  describe "upload jpg" do
    let(:photo_path) { path_to_fixture "jonmagic.jpg" }

    it "uploads image using date, md5sum, and extension for path" do
      expect(upload.persisted_photo.public_url).to \
        eq("https://foto-test.s3.amazonaws.com/2013/12/2/8079bd4fd6d99b2a9891763df1a4cda9.jpg")
    end
  end

  describe "upload png" do
    let(:photo_path) { path_to_fixture "jonmagic.png" }

    it "uploads image using date, md5sum, and extension for path" do
      expect(upload.persisted_photo.public_url).to \
        eq("https://foto-test.s3.amazonaws.com/2013/12/22/2796cc91eeee95410b600ae7c12952bc.png")
    end
  end

  describe "upload png" do
    let(:photo_path) { path_to_fixture "johndbritton.tiff" }

    it "uploads image using date, md5sum, and extension for path" do
      expect(upload.persisted_photo.public_url).to \
        eq("https://foto-test.s3.amazonaws.com/2013/8/24/b2816cd510693da11786a9a8827d9254.tiff")
    end
  end
end
