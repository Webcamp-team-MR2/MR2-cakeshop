class Customer::OrdersController < Customer::CustomerapplicationsController
  before_action :current_customer
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  def index
    @orders = current_customer.orders
  end

  def thanks
  end

  def create

  end
end
  private
  def cartitem_params
    params.require(:cartitem).permit( :customer_id, :item_id, :count )
  end
  def order_params
      params.require(:order).permit( :customer_id, :postal_code, :address, :full_name, :order_status, :pay_method, :shipping_fee,:total_price )
  end
  def orderitem_params
    params.require(:orderitem).permit( :order_id, :item_id, :price, :count, :create_status, )
  end
