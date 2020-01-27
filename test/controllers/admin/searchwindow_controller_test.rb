require 'test_helper'

class Admin::SearchwindowControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_searchwindow_index_url
    assert_response :success
  end

  test "should get search" do
    get admin_searchwindow_search_url
    assert_response :success
  end

end
