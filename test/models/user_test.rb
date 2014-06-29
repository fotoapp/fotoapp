require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "validates_presence_of" do
    user = users(:jonmagic)
    user.username = nil

    refute user.valid?
    assert_equal ["can't be blank"], user.errors.messages[:username]
  end
end
