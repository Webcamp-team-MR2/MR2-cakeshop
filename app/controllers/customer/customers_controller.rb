class Customer::CustomersController < Customer::CustomerapplicationsController
  before_action :current_customer
  def show
    
  end

  def edit

  end

  def with_draw
  end

  def update
    if current_customer.update(customer_params)
      flash[:notice] = "編集に成功しました"
      redirect_to customer_path
    else
      render :edit
    end
  end

  def destroy
      current_customer.update(customer_status: false)
      # current_customer.update(customer_params)
      redirect_to destroy_customer_session_path, method: :delete
  end

private
  def customer_params
    params.require(:customer).permit(:first_name,:last_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:tel,:customer_status)
  end
end