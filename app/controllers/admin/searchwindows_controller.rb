class Admin::SearchwindowsController < Admin::AdminapplicationsController
  def index
    path = Rails.application.routes.recognize_path(request.referer)

    if params[:search] == "" || params[:search] == nil
    redirect_to controller: path[:controller], action: path[:action], id: path[:id]
    else
      @items = []
      split_keyword = params[:search].split(/[[:blank:]]+/)
      split_keyword.each do |search|
      @items += Item.where('name LIKE(?)', "%#{search}%")
    end
    @items = Kaminari.paginate_array(@items).page(params[:page]).per(6)
    @items.uniq!
    end
  end
end