require 'test_helper'

class BusinessRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_request = business_requests(:one)
  end

  test "should get index" do
    get business_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_business_request_url
    assert_response :success
  end

  test "should create business_request" do
    assert_difference('BusinessRequest.count') do
      post business_requests_url, params: { business_request: { band_decision: @business_request.band_decision, location: @business_request.location, pay: @business_request.pay } }
    end

    assert_redirected_to business_request_url(BusinessRequest.last)
  end

  test "should show business_request" do
    get business_request_url(@business_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_business_request_url(@business_request)
    assert_response :success
  end

  test "should update business_request" do
    patch business_request_url(@business_request), params: { business_request: { band_decision: @business_request.band_decision, location: @business_request.location, pay: @business_request.pay } }
    assert_redirected_to business_request_url(@business_request)
  end

  test "should destroy business_request" do
    assert_difference('BusinessRequest.count', -1) do
      delete business_request_url(@business_request)
    end

    assert_redirected_to business_requests_url
  end
end
