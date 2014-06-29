module FixturesHelper
  # Public: Path to fixture.
  #
  # filename - File name with extensions.
  #
  # Returns a Pathname.
  def path_to_fixture(filename)
    Rails.root.join("test", "fixtures", "#{filename}")
  end
  # Public: Loads fixture for use in specs.
  #
  # name      - Name of the file to load without the extension.
  # extension - File extension of the fixture to load (default: 'json').
  #
  # Returns a String.
  def fixture(name, extension="jpg")
    File.open(path_to_fixture("#{name}.#{extension}"))
  end

  # Public: Loads a json fixture and parses it.
  #
  # name - Name of the file to load without the extension.
  #
  # Returns a Hash or Array.
  def json_fixture(name)
    ActiveSupport::JSON.decode(fixture(name))
  end

  # Public: Create a tempfile from a file. Needed for #uploaded_file in order
  # to prevent our fixtures from getting removed.
  #
  # filename - String filename.
  #
  # Returns a Tempfile.
  def tempfile_from_file(filename)
    tempfile = Tempfile.new(filename)
    tempfile.write File.read(path_to_fixture(filename))
    tempfile.rewind
    tempfile
  end

  # Public: Uploaded file for testing attachments.
  #
  # filename     - Attachment filename.
  # content_type - Attachment mime type.
  #
  # Returns a Rack::Test::UploadedFile.
  def uploaded_file(filename, content_type)
    options = {
      :filename     => filename,
      :tempfile     => tempfile_from_file(filename),
      :type         => content_type
    }
    ActionDispatch::Http::UploadedFile.new(options)
  end
end
