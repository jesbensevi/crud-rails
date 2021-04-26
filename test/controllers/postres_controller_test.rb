require 'test_helper'

class PostresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postres_index_url
    assert_response :success
  end

  test "should get read" do
    get postres_read_url
    assert_response :success
  end

  test "should get create" do
    get postres_create_url
    assert_response :success
  end

  test "should get update" do
    get postres_update_url
    assert_response :success
  end

end
