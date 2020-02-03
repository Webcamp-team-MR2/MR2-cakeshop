class Customer::CartItemsController < Customer::CustomerapplicationsController
  def edit
  end

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
    @total = 0
  end

  def confirm
    @cart_items = current_customer.cart_items
    @shipping_fee = 800  ##ここ送料！！
    @total_price = 0
    @total_count = 0
    if params[:pay_method].to_i == 0
      @pay_method = "クレジットカード"
    else @pay_method = "現金振込み"
    end
    if params[:name].to_i == 0
      @postal_code = current_customer.postal_code
      @address = current_customer.address
      @full_name = current_customer.last_name + current_customer.first_name
    elsif params[:name].to_i == 1
      selected = Address.find(params[:address_id])
      @postal_code = selected.postal_code
      @address = selected.address
      @full_name = selected.full_name
    else
      @postal_code = params[:postal_code].to_i
      @address = params[:address]
      @full_name = params[:full_name]
    end
  end


def create
  @customer = current_customer
  @cart_items = @customer.cart_items
  x = 0
  @cart_items.each do |cart_item|
    if cart_item.item_id == params[:cart_item][:item_id].to_i
      cart_item.count += params[:cart_item][:count].to_i
      cart_item.save!
      x =1
    end
  end
  if x == 0
     @add_cart_item = CartItem.new(cartitem_params)
     @add_cart_item.save!
   end
  redirect_to cart_items_path
end

  def edit
    @order = Order.new
    @customer = current_customer
    @name =  @customer.last_name + @customer.first_name
    @addresses = current_customer.addresses

  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cartitem_params)
      flash[:notice] = "変更されました!"
      redirect_to cart_items_path
    else
      redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
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

