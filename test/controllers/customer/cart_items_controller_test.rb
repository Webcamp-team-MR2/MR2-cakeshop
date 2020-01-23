require 'test_helper'

class Customer::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get customer_cart_items_edit_url
    assert_response :success
  end

  test "should get index" do
    get customer_cart_items_index_url
    assert_response :success
  end

  test "should get confirm" do
    get customer_cart_items_confirm_url
    assert_response :success
  end

end
