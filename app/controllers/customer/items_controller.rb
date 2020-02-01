class Customer::ItemsController < Customer::CustomerapplicationsController
  def show
  	@customer = current_customer
    @item = Item.find(params[:id])
    @cartitem_new = CartItem.new
  end
end
