class Public::ItemsController < Public::Base
  def index
  	@items = Item.where(is_active: true)
  	@genres = Genre.where(is_active: true)
  end

  def show
  end
end
