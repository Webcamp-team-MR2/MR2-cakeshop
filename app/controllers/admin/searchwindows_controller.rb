class Admin::SearchwindowsController < Admin::AdminapplicationsController
  def index
    if params[:search] == "" || params[:search] == nil
      @items = []
    else
      split_keyword = params[:search].split(/[[:blank:]]+/)
      @items = []
      split_keyword.each do |search|
    next if search == ""
      @items += Item.where('name LIKE(?)', "%#{search}%")
      end
      @items.uniq!
    end
  end
end