class Customer::AddressesController < Customer::CustomerapplicationsController
  before_action :current_customer

  def edit
    @address = Address.find(params[:id])
    
  end


  def index
    @addresses = current_customer.addresses
        # @addresses = Address.where(customer_id :current_customer.id)
    @address_new = Address.new
  end

  def create
    @addresses = current_customer.addresses
    @address_new = Address.new(address_params)
    # @address_new = Address.new
    @address_new.customer_id = current_customer.id
    if  @address_new.save
      flash[:notice] = "配送先を新規登録しました"
      redirect_to addresses_path
    else
 	    render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    if @address.update(address_params)
      flash[:notice] = "配送先の内容を更新しました"
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
	  address.customer_id = current_customer.id
    address.destroy
    flash[:notice] = "配送先を削除しました"
	  redirect_to addresses_path
  end
end
private
    def address_params
        params.require(:address).permit(:postal_code, :address, :full_name)
    end
