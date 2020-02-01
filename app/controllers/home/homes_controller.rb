class Home::HomesController < ApplicationController
  def top
    @items = Item.all
    @categories = Category.all
  end

  def about
  end
end
