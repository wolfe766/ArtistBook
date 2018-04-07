require 'test_helper'

=begin
CREATED: David Levine: 4/7/2018
Description: Tests that ensure our band object
works and that critical validations work as well.
=end

class BandTest < ActiveSupport::TestCase
  def setup
  	#Get a new devise Band object
  	@band = Band.new
  	@band.band_name = "Band Boys"
  	@band.genre = "Rock"
  	@band.phone = "614-124-9378"
  	@band.address = "123 Sample Street, Columbus, Oh, 42303"
  	@band.email = "nice@bands.com"
  	@band.password= "password!"
  end

  test "Setup Band Should Be Valid" do
  	assert @band.valid?
  end

  test "band_name should be present 1" do
  	@band.band_name = ""
  	assert_not @band.valid?
  end

  test "band_name should be present 2" do
  	@band.band_name = " "
  	assert_not @band.valid?
  end

  test "band_name should be present 3" do
  	@band.band_name = "	"
  	assert_not @band.valid?
  end

  test "band_name length should be at most 250 char 1" do
  	@band.band_name = "a" * 250
  	assert @band.valid?
  end

  test "band_name length should be at most 250 char 2" do
  	@band.band_name = "a" * 251
  	assert_not @band.valid?
  end

  test "genre length should be at most 100 char 1" do
  	@band.genre = "a" * 100
  	assert @band.valid?
  end

  test "genre length should be at most 100 char 2" do
  	@band.genre = "a" * 101
  	assert_not @band.valid?
  end

  test "genre phone regex works 1" do
  	@band.phone = "935642899"
  	assert_not @band.valid?
  end

  test "genre phone regex works 2" do
  	@band.phone = "3546"
  	assert_not @band.valid?
  end

end
