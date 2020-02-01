class Admin::OrdersController < Admin::AdminapplicationsController
  def index
    rute = params[:page]

    if rute == "1"
      @orders = Order.all
    elsif rute == "2"
      range = Date.today.beginning_of_day..Date.today.end_of_day
      @orders = Order.where(created_at: range)
      # @orders = Order.where("created_at between '#{Date.today} 0:00:00' and '#{Date.today} 23:59:59'")
    elsif rute == "3"
      @orders = Order.where(customer_id: params[:customer_id])
      #                    検索したいモデルのカラム名: params[:検索させたいパラメータ]　
    end
    
  end

  def edit
    @order = Order.find(params[:id])
    @order_items = @order.order_items
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
      @order_item.create_status_create?
      @order_item.order.order_status_creating!
      @order_item.create_status_completed?
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
