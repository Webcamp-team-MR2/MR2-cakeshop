class Admin::SearchwindowsController < Admin::AdminapplicationsController
  def index
    @items = Item.all
  end

  def search
    @items = Item.where("name LIKE ?", "%#{params[:search]}%")
    render :index
  end
end