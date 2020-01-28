class Admin::CustomersController < Admin::AdminapplicationsController
  def top
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    	flash[:notice] = "You have updated customerstatus successfully."
    	redirect_to admin_customer_path
    else
      flash[:notice] = "You dont have updated customerstatus successfully."
    @customer = Customer.find(params[:id])
    render 'edit'
   end
  end

  private
  def customer_params
     params.require(:customer).permit(:customer_id,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:tel,:email,:customer_status)
  end
end
