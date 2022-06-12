require "test_helper"

class AreasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get areas_index_url
    assert_response :success
  end

  test "should get edit" do
    get areas_edit_url
    assert_response :success
  end
end
