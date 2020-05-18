require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get requests_new_url
    assert_response :success
  end

  test "should get create" do
    get requests_create_url
    assert_response :success
  end

  test "should get show" do
    get requests_show_url
    assert_response :success
  end

  test "should get update" do
    get requests_update_url
    assert_response :success
  end

  test "should get incoming" do
    get requests_incoming_url
    assert_response :success
  end

  test "should get outgoing" do
    get requests_outgoing_url
    assert_response :success
  end

end
