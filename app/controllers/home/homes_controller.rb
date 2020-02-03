class Home::HomesController < ApplicationController
  def top
    @items = Item.all
    @categories = Category.all
  end

  def about
  end

  def category
    @category = Category.find(params[:id])
    @category_item = Item.where(category_id: params[:id])
  end
end

