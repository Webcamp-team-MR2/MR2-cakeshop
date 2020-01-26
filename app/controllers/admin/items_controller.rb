class Admin::ItemsController < Admin::AdminapplicationsController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save
    # binding.pry
    redirect_to admin_items_path
  end

  def update
    @item = Item.find(params[:id])
    @item.update
    redirect_to @item
  end

  def destroy
  end

  private
    def item_params
        params.require(:item).permit(:name,:image,:price,:category_id,:description)
    end
  
end
