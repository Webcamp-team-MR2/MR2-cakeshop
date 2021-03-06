class Admin::OrdersController < Admin::AdminapplicationsController
  def index
      @orders = Order.all.page(params[:page])
  end

  def period_index
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @orders = Order.where(created_at: range).page(params[:page])
  end

  def customer_index
    @orders = Order.where(params[:id]).page(params[:page])
  end

  def edit
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total_price = 0
    @order_items.each do |f|
      @total_price = (f.price * f.count) + @total_price
    end
    # @orders = OrderItem.where(params[:order_id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    order_items = order.order_items
    order.order_status_verification?
      order_items.each do |f|
        f.create_status = 1
        f.update(order_item_params)
      end
    redirect_to edit_admin_order_path(order)
  end
  
  def item_update
    @order_item = OrderItem.find(params[:order_item_id])
    if @order_item.update(item_params)
      if @order_item.create_status == "create"
        @order_item.order.order_status_creating!
      end
      if @order_item.create_status == "completed"
        @order_item.order.order_items.each do |f|
          if f.create_status == "completed"
          else
            redirect_to edit_admin_order_path(f.order_id) and return
          end
        end
        @order_item.order.order_status_shipping!
      end
      redirect_to edit_admin_order_path(@order_item.order_id)
    end
  end
    # if @order_item.update(item_params)
    #   if @order_item.create_status == 2
    #     @order_item.order.update(order_status: 2)
    #   elsif @order_item.create_status == 3
    #     @order_item.order.order_items.each do |f|
    #       if f.create_status == 3
    #       else
    #         redirect_to edit_admin_order_path(f.order_id) and return
    #       end
    #     end
    #     @order_item.order.update(order_status: 3)
    #   end
    #   redirect_to edit_admin_order_path(@order_item.order_id)
    # end

  private
    def order_params
        params.require(:order).permit(:order_status)
    end

    def item_params
      params.require(:order_item).permit(:create_status)
    end

    def order_item_params
      params.permit(:create_status)
    end

    def item_order_params
      params.permit(:order_status)
    end

end
