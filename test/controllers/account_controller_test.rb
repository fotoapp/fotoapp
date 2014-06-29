require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "GET #show returns http success" do
    sign_in users(:jonmagic)
    get :show

    assert_response 200
  end
end
