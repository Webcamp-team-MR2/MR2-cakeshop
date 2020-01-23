require 'test_helper'

class Home::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get home_homes_top_url
    assert_response :success
  end

  test "should get about" do
    get home_homes_about_url
    assert_response :success
  end

end
