class Admin::ItemsController < Admin::AdminapplicationsController
  def new
    @item = Item.new
  end

  def index
    #ビューから値をもらってきてパーシャルで検索できるような書き方
    @items = Item.all.page(params[:page])
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
    # binding.pry
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
