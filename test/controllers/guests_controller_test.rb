require "test_helper"

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get user_guest" do
    get guests_user_guest_url
    assert_response :success
  end

  test "should get admin_guest" do
    get guests_admin_guest_url
    assert_response :success
  end
end
