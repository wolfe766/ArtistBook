require 'test_helper'

class DeveloperControllerTest < ActionDispatch::IntegrationTest
  test "should get about_us" do
    get developer_about_us_url
    assert_response :success
  end

  test "should get developer_info" do
    get developer_developer_info_url
    assert_response :success
  end

end
