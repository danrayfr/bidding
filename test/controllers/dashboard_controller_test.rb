require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in users(:danray)
    get dashboard_url
    assert_response :success
  end
end
