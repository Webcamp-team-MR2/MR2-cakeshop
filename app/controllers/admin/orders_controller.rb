class Admin::OrdersController < Admin::AdminapplicationsController
  def index
    @orders = Order.all
  end

  def edit
    @orders = OrderItem.where(params[:order_id])
  end

  def update
  end
end
