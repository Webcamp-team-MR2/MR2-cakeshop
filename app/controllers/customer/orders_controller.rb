class Customer::OrdersController < Customer::CustomerapplicationsController
  before_action :current_customer
  def show
    # @order = Order.find(params[:id])
    # @order_items = OrderItem.where(order_id: params[:id])
  end

  def index
    # @orders = current_customer.orders
  end

  def thanks
  end

  def create
    if params[:order][:pay_method] == "クレジットカード"
      params[:order][:pay_method] = 0
      order_params[:pay_method] = params[:order][:pay_method]
      else
        params[:order][:pay_method] = 1
        order_params[:pay_method] = params[:order][:pay_method]
    end
    @order = Order.new(order_params)
    if @order.save
      @cart_items = current_customer.cart_items
       @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = cart_item.item_id
        @order_item.price = cart_item.item.price
        @order_item.count = cart_item.count
        @order_item.subtotal = (cart_item.item.price*1.1).round(0)*cart_item.count
        @order_item.save
       end
       CartItem.where(customer_id: current_customer.id).destroy_all
       redirect_to orders_thanks_path
    else redirect_to cart_items_path
    end
  end

  private
  def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :full_name, :order_status, :shipping_fee,:total_price, :item_count, :pay_method)
  end
end