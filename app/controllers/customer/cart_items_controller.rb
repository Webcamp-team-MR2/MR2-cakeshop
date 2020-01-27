class Customer::CartItemsController < Customer::CustomerapplicationsController
  def edit
  end

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
    # binding.pry
  end

  def confirm
  end

  def create
  end

  def edit
    @customer = current_customer
    @cart_items = @customer.cart_items
  end

  def update
  end

  def destroy
      @customer = current_customer
      @cart_items = @customer.cart_items
      @cart_items.destroy
      redirect_to cart_items_path
  end
end