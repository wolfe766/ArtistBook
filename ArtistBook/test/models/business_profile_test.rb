require 'test_helper'

class BusinessProfileTest < ActiveSupport::TestCase
  
  # Test setup
  def setup
    # Test Business Profile 1
    @profile = BusinessProfile.new
    @profile.bio = "a" * 1000
    @profile.spotify_link = "spotify_link.com"
  end

  # Test business profile one
  test "Profile Bio - Valid" do 
    assert_equal @profile.bio, 'a' * 1000
  end 

  test "Profile Spotify Link - Valid" do
    assert_equal @profile.spotify_link, "spotify_link.com"
  end 
end
