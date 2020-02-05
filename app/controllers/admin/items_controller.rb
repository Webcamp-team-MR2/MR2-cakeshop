class Admin::ItemsController < Admin::AdminapplicationsController
  def new
    @item = Item.new
  end

  def index
    @categories = Category.where(category_status: 0)
    items = {}
    @categories.each do |category|
      category.items.each do |item|
      items[item.id] = item
      end
    end
    @items = items.sort
    @items = Kaminari.paginate_array(@items).page(params[:page]).per(6)
   end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save(item_params)
    redirect_to admin_items_path
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path
  end

  private
    def item_params
        params.require(:item).permit(:name,:image,:price,:category_id,:description,:sale_status)
    end
  
  end
