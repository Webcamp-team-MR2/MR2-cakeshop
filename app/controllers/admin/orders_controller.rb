class Admin::OrdersController < Admin::AdminapplicationsController
  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    # @orders = OrderItem.where(params[:order_id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to edit_admin_order_path(@order)
  end
  
  def item_update
    @order_item = OrderItem.find(params[:order_item_id])
    @order_item.update(item_params)
    redirect_to edit_admin_order_path(@order)
  end

  private
    def order_params
        params.require(:order).permit(:order_status)
    end

    def item_params
      params.require(:order_item).permit(:create_status)
    end

end
