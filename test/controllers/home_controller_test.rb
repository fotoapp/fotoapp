require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "GET #index returns http success" do
    get :index

    assert_response 200
  end
end
