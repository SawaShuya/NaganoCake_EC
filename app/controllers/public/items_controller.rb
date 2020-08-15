class Public::ItemsController < Public::Base
  def index
  	@items = Item.where(is_active: true)
  	@genres = Genre.where(is_active: true)
  end

  def show
  	@item = Item.find(params[:id])
  	@genres = Genre.where(is_active: true)

  	@cart_item = CartItem.new
  	@cart_item.item_id = @item.id
  	@cart_item.end_user_id = current_end_user.id
  end
end
