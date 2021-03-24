class Public::ItemsController < ApplicationController
	before_action :authenticate_end_user!, except: [:index]
	before_action :set_genre

  def index
  	@items = Item.where(is_active: true)
  end

  def show
  	@item = Item.find(params[:id])
  	@cart_item = CartItem.new
  end

	private
	def set_genre
		@genres = Genre.where(is_active: true)
	end
end
