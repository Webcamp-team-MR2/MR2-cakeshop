class Customer::CartItemsController < Customer::CustomerapplicationsController
  def edit
  end

  def index
    @cart_items = CartItem.all
  end

  def confirm
  end

  def create
  end

  def update
  end

  def destroy
  end
  
end
