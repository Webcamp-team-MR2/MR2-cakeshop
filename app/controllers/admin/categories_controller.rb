class Admin::CategoriesController < Admin::AdminapplicationsController
  def index
    @category = Category.new
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    	if @category.save(category_params)
  		flash[:notice] = "You have creatad category successfully."
    redirect_to admin_categories_path
    else
      flash[:notice] = "You dont have creatad category successfully."
      @categories = Category.all
      @category = Category.new
      render 'index'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
    	flash[:notice] = "You have updated category successfully."
    	redirect_to admin_categories_path
    else
      flash[:notice] = "You dont have updated  category successfully."
    @category = Category.find(params[:id])
    render 'edit'
   end
  end

  def destroy
  	category = Category.find(params[:id])
  	category.destroy
  	redirect_to admin_categories_path
  end

  private
  def category_params
     params.require(:category).permit(:sweets_name, :category_status)
  end
end
