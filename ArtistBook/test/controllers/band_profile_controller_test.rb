require 'test_helper'

class BandProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get band_profile_profile_url
    assert_response :success
  end

end
