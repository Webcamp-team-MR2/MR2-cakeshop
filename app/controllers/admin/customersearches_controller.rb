class Admin::CustomersearchesController < Admin::AdminapplicationsController
  def index
    path = Rails.application.routes.recognize_path(request.referer)

    if params[:search] == "" || params[:search] == nil
    redirect_to controller: path[:controller], action: path[:action], id: path[:id]
    else
    @customers = []
    split_keyword = params[:search].split(/[[:blank:]]+/)
    split_keyword.each do |search|
    @customers = Customer.where('last_name LIKE(?) OR first_name LIKE(?)', "%#{search}%", "%#{search}%")
    end
    @customers = Kaminari.paginate_array(@customers).page(params[:page]).per(1)
    @customers.uniq!
    end
  end
end
