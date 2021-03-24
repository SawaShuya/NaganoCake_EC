class Public::CartItemsController < ApplicationController
	before_action :authenticate_end_user!
	before_action :set_cart_items, only: [:index, :destroy_all]
	before_action :set_cart_item, only: [:update, :destroy]
	before_action :check_amount, only: [:create, :update]

	def index; end

	def update
		if @cart_item.update(cart_item_params)
			flash[:notice] = "update cart item successfully"
		else
			flash[:notice] = "error"
		end
		redirect_to cart_items_path
	end

	def destroy
		@cart_item.destroy
		flash[:notice] = "deleted item form your cart"
		redirect_to cart_items_path
	end

	def destroy_all
		@cart_items.destroy_all
		flash[:notice] = "deleted all items form your cart"
		redirect_to cart_items_path
	end

	def create
		@cart_item, total_amount = CartItem.already_regitered(params[:cart_item][:item_id].to_i, current_end_user, params[:cart_item][:amount].to_i)
		if @cart_item.present?
			if @cart_item.update(amount: total_amount)
				flash[:notice] = "update cart item successfully"
			else
				flash[:notice] = "error"
			end
		else
			@cart_item = CartItem.new(cart_item_params)
			if @cart_item.save
				flash[:notice] = "add cart item successfully"
			else
				flash[:notice] = "error"
			end
		end
		redirect_to cart_items_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:end_user_id, :item_id, :amount)
	end


	def set_cart_items
		@cart_items = current_end_user.cart_items.includes(:item)
	end

	def set_cart_item
		@cart_item = CartItem.find(params[:id])
	end

	def check_amount
		if params[:cart_item][:amount].to_i <= 0
			flash[:notice] = "Please enter a number greater than 0"
			redirect_back(fallback_location: root_path)
		end
	end
end
