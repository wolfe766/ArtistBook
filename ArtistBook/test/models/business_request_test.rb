require 'test_helper'

=begin
  CREATED: Brandon Brown 04/07/2018
  Descripition: Test cases for new business request object
  and attributes are validated correctly
=end

class BusinessRequestTest < ActiveSupport::TestCase

  def setup 

    # Setup new business request objects
    @request_one = BusinessRequest.new
    @request_one.pay = 5.00
    @request_one.location = "133 North High St"
    @request_one.band_decision = false
    
    @request_two = BusinessRequest.new
    @request_two.pay = 0.99
    @request_two.location = "133 North High St"
    @request_two.band_decision = false

    @request_three = BusinessRequest.new
    @request_three.pay = 1000.00
    @request_three.location = "152 Neil Avenue"
    @request_three.band_decision = true

    @request_four = BusinessRequest.new
    @request_four.pay = -1.00
    @request_four.location = "152 Neil Avenue"
    @request_four.band_decision = true

  end

  # Test business request one
  test "Business Request One - Check Pay" do
    assert_equal(5.00, @request_one.pay)
  end

  test "Business Request One - Check Location" do
    assert_equal("133 North High St", @request_one.location)
  end
 
  test "Business Request One - Check Band Decision" do
    assert_equal(false, @request_one.band_decision)
  end

  # Test business request two
  test "Business Request Two - Check Pay" do
    assert_equal(0.99, @request_two.pay)
  end

  test "Business Request Two - Check Location" do
    assert_equal("133 North High St", @request_two.location)
  end
 
  test "Business Request Two - Check Band Decision" do
    assert_equal(false, @request_two.band_decision)
  end

  # Test business request three
  test "Business Request Three - Check Pay" do
    assert_equal(1000.00, @request_three.pay)
  end

  test "Business Request Three - Check Location" do
    assert_equal("152 Neil Avenue", @request_three.location)
  end
 
  test "Business Request Three - Check Band Decision" do
    assert_equal(true, @request_three.band_decision)
  end

  # Test business request four
  test "Business Request Four - Check Pay" do
    assert_equal(-1.00, @request_four.pay)
  end

  test "Business Request Four - Check Location" do
    assert_equal("152 Neil Avenue", @request_four.location)
  end
 
  test "Business Request Four - Check Band Decision" do
    assert_equal(true, @request_four.band_decision)
  end

end
