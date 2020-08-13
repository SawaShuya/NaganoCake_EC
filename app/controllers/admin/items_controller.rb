class Admin::ItemsController < Admin::Base

	def index
		@items = Item.all
	end

	def new
		@item = Item.new
		@genres = Genre.where(is_active: true)
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			flash[:notice] = "create item successfully"
			redirect_to admin_item_path(@item)
		else
			@genres = Genre.where(is_active: true)
			render "new"
		end
	end

	def show
	end

	def edit
	end

	def update
	end

	private
	def item_params
		params.require(:item).permit(:name, :explanation, :non_taxed_price, :item_image, :is_active, :genre_id)
	end

end
