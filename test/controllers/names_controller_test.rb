require "test_helper"

class NamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get names_index_url
    assert_response :success
  end
end
