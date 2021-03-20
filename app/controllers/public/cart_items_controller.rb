class Public::CartItemsController < ApplicationController
	def index
		@cart_items = CartItem.where(end_user_id: current_end_user.id)
	end

	def update
		@cart_item = CartItem.find(params[:id])
		if @cart_item.update(cart_item_params)
			flash[:notice] = "update cart item successfully"
			redirect_to cart_items_path
		else
			@cart_items = CartItem.all
			render "index"
		end
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		flash[:notice] = "deleted item form your cart"
		redirect_to cart_items_path
	end

	def destroy_all
		CartItem.where(end_user_id: current_end_user.id).destroy_all
		flash[:notice] = "deleted all items form your cart"
		redirect_to cart_items_path
	end

	def create
		if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
			@cart_item = CartItem.find_by(end_user_id: current_end_user.id, item_id: params[:cart_item][:item_id])
			@cart_item.amount += params[:cart_item][:amount].to_i
			if @cart_item.save(cart_item_params) && params[:cart_item][:amount] != ""
				flash[:notice] = "update cart item successfully"
				redirect_to cart_items_path
			else
				flash[:notice] = "select amouut of items"
				redirect_to item_path(@cart_item.item_id)
			end

		else
			@cart_item = CartItem.new(cart_item_params)
			if @cart_item.save
				flash[:notice] = "add cart item successfully"
				redirect_to cart_items_path
			else
				flash[:notice] = "select amouut of items"
				redirect_to item_path(@cart_item.item_id)
			end
		end
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:end_user_id, :item_id, :amount)
	end

end
