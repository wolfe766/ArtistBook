require 'test_helper'

class BusinessProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get business_profile_profile_url
    assert_response :success
  end

end
