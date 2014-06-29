require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "path and checksum must be unique" do
    exception = assert_raises(ActiveRecord::RecordInvalid) {
      Photo.create!(photos(:jpg).attributes)
    }

    assert_equal \
      "Validation failed: Path has already been taken, Checksum has already been taken",
      exception.message
  end
end
