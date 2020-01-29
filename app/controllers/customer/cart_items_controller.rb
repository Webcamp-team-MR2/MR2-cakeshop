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
  @customer = current_customer
  @cart_items = @customer.cart_items
  <% @cart_items.each do |cart_item|% >
  if cart_item.item_id == params[:cart_item][:item_id]
    cart_item.count += params[:cart_item][:count]
    redirect_to cart_items_path
    # binding.pry
    else
     @add_cart_item = CartItem.new(cartitem_params)
     @add_cart_item.save
     redirect_to cart_items_path
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





