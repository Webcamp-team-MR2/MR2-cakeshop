class Customer::ItemsController < Customer::CustomerapplicationsController
  def show
    @item = Item.find(params[:id])
    @item_count = CartItem.new
  end
end
