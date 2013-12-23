require "spec_helper"

describe PhotoStore::Upload do
  let(:photo_store) { PhotoStore.make! :folder_name => "foto-test" }
  let(:folder) {
    photo_store.connection.directories.create(:key => photo_store.folder_name)
    photo_store.folder
  }
  let(:upload) { PhotoStore::Upload.new(folder, photo_path, {:public? => true}) }

  describe "upload jpg" do
    let(:photo_path) { path_to_fixture "jonmagic.jpg" }

    it "uploads image using date, md5sum, and extension for path" do
      expect(upload.uploaded_file.public_url).to \
        eq("https://foto-test.s3.amazonaws.com/2013/12/2/8079bd4fd6d99b2a9891763df1a4cda9.jpg")
    end
  end

  describe "upload png" do
    let(:photo_path) { path_to_fixture "jonmagic.png" }

    it "uploads image using date, md5sum, and extension for path" do
      expect(upload.uploaded_file.public_url).to \
        eq("https://foto-test.s3.amazonaws.com/2013/12/22/2796cc91eeee95410b600ae7c12952bc.png")
    end
  end

  describe "upload png" do
    let(:photo_path) { path_to_fixture "johndbritton.tiff" }

    it "uploads image using date, md5sum, and extension for path" do
      expect(upload.uploaded_file.public_url).to \
        eq("https://foto-test.s3.amazonaws.com/2013/8/24/b2816cd510693da11786a9a8827d9254.tiff")
    end
  end
end
