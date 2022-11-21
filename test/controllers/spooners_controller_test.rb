require "test_helper"

class SpoonersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spooners_index_url
    assert_response :success
  end

  test "should get new" do
    get spooners_new_url
    assert_response :success
  end
end
