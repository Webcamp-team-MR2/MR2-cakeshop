class Admin::OrdersController < Admin::AdminapplicationsController
  def index
    @orders = Order.all
  end

  def edit
  end

  def update
  end
end
