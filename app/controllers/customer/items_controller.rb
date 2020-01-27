class Customer::ItemsController < Customer::CustomerapplicationsController
  def show
  	@customer = current_customer
    @item = Item.find(params[:id])
    @item_count = CartItem.new
  end
end
