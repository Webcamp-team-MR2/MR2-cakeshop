class Customer::CartItemsController < Customer::CustomerapplicationsController
  def edit
  end

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
  end

  def confirm
  end

  def create
    @cart_item = CartItem.new(cartitem_params)
# binding.pry
    if @cart_item.save
      redirect_to cart_items_path
    else redirect_to item_path
    end
  end

  def edit

  end

  def update
  end

  def destroy
      # @customer = current_customer
      # @cart_items = @customer.cart_items
      # @cart_items.destroy
      # redirect_to cart_items_path
  end
end

private
  def cartitem_params
      params.require(:cart_item).permit(:customer_id, :item_id, :count)
  end