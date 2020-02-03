class Admin::SearchwindowsController < Admin::AdminapplicationsController
  def index
    path = Rails.application.routes.recognize_path(request.referer)
    if params[:search] == "" || params[:search] == nil
    redirect_to controller: path[:controller], action: path[:action]
    else
      split_keyword = params[:search].split(/[[:blank:]]+/)
      @items = []
      split_keyword.each do |search|
    next if search == ""
      @items += Item.where('name LIKE(?)', "%#{search}%").paginate_array(@item).page(1).per(10)
      end
      @items.uniq!
    end
  end
end