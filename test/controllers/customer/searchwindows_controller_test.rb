require 'test_helper'

class Customer::SearchwindowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_searchwindows_index_url
    assert_response :success
  end

end
