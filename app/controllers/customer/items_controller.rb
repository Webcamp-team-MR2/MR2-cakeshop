class Customer::ItemsController < Customer::CustomerapplicationsController
  def show
    @item = Item.find(params[:id])
    @item_count = Cart_item.new
  end
end
