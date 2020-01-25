class Admin::CategoriesController < Admin::AdminapplicationsController
  def index
    @category = Category.new
    @categories = Category.all
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.save
    # redirect_to admin_categories_path
  end

  def update
    @category = category.find(params[:id])
    @category.update(category_params)
  end

 private
  def category_params
     params.require(:category).permit(:sweets_name)
  end
end
