require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Online Bidding"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end
end
