require 'test_helper'

class Admin::MsuVideosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_msu_videos_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_msu_videos_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_msu_videos_destroy_url
    assert_response :success
  end

end
