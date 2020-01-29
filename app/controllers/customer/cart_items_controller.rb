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
  unless @cart_items.present?
    @add_cart_item = CartItem.new(cartitem_params)
    @add_cart_item.save!
  end
  @cart_items.each do |cart_item|

  if cart_item.item_id == params[:cart_item][:item_id].to_i
     cart_item.count += params[:cart_item][:count].to_i
     cart_item.update(cart_item)
    else
     @add_cart_item = CartItem.new(cartitem_params)
     @add_cart_item.save!
  end
  end
  redirect_to cart_items_path
end

  def edit

  end

  def update
  end

  def destroy
    @cart_item.item_id = params[:cart_item][:item_id].to_i
    @cart_item.item.id.destroy
    redirect_to cart_items_path
  end
  def all_destroy
    @customer = current_customer
    @cart_items = @customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
end

private
  def cartitem_params
      params.require(:cart_item).permit(:customer_id, :item_id, :count)
  end





