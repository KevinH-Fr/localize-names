require "test_helper"

class NamsorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get namsor_index_url
    assert_response :success
  end
end
