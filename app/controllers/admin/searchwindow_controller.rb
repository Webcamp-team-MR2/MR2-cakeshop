def index
  @items = Item.all 
  @customers = Customer.all
  # @check = params[:q]#検索範囲を入れたローカル変数
  #  if @check == {"name_cont"=>""}
  #        redirect_to ""
  #     else
  #        @search = User.ransack(@check)
  #        @results = @search.result
  #     end
  # def search
  # end
end
