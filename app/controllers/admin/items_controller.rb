class Admin::ItemsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_item, only: [:new]
	before_action :set_active_genres, only: [:new]
	def index
		@items = Item.search(params[:search])
	end

	def new; end

	def create
		@item = Item.new(item_params)
		if @item.save
			flash[:notice] = "create item successfully"
			redirect_to admin_item_path(@item)
		else
			set_active_genres
			render "new"
		end
	end

	def show; end

	def edit; end

	def update; end

	private
	def item_params
		params.require(:item).permit(:name, :explanation, :non_taxed_price, :item_image, :is_active, :genre_id)
	end

	def set_item
		@item = Item.find_or_initialize_by(id: params[:id])
	end

	def set_active_genres
		@genres = Genre.where(is_active: true)
	end

end
