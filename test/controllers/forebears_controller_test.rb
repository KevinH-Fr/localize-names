require "test_helper"

class ForebearsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get forebears_index_url
    assert_response :success
  end
end
