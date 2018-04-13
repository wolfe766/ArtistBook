require 'test_helper'

class BandProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @band_profile = band_profiles(:one)
  end

  test "should get index" do
    get band_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_band_profile_url
    assert_response :success
  end

  test "should create band_profile" do
    assert_difference('BandProfile.count') do
      post band_profiles_url, params: { band_profile: { bio: @band_profile.bio, photo_path: @band_profile.photo_path, spotify_link: @band_profile.spotify_link } }
    end

    assert_redirected_to band_profile_url(BandProfile.last)
  end

  test "should show band_profile" do
    get band_profile_url(@band_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_band_profile_url(@band_profile)
    assert_response :success
  end

  test "should update band_profile" do
    patch band_profile_url(@band_profile), params: { band_profile: { bio: @band_profile.bio, photo_path: @band_profile.photo_path, spotify_link: @band_profile.spotify_link } }
    assert_redirected_to band_profile_url(@band_profile)
  end

  test "should destroy band_profile" do
    assert_difference('BandProfile.count', -1) do
      delete band_profile_url(@band_profile)
    end

    assert_redirected_to band_profiles_url
  end
end
