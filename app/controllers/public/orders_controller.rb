class Public::OrdersController < ApplicationController
	before_action :authenticate_end_user!
	before_action :check_and_set_cart_items, only: [:new, :confirm]
	def new
		@order = Order.new
		@addresses = current_end_user.addresses
	end

	def confirm
		@order = Order.new(order_params)
		@cart_items = @cart_items.includes(:item)
		@order.set_address(current_end_user, params[:order][:address_option].to_i, params[:order][:address_id].to_i)
		@order.order_details.build
	end

	def finish; end

	def create
		@order = current_end_user.orders.new(order_params)

		if @order.save
			current_end_user.cart_items.delete_all
			flash[:notice] = "create oreder successfully"
			redirect_to order_finish_path
		else
			flash[:notice] = "cannnot create oreder"
			redirect_to new_order_path
		end
	end

	def index; end

	def show; end


	private
	def order_params
		params.require(:order).permit(:end_user_id, :payment_method, :total_payment, :postal_code, :destination_address, :consignee, :postage, [order_details_attributes: [:order_id, :item_id, :amount, :non_taxed_price]])
	end

	def check_and_set_cart_items
		@cart_items = current_end_user.cart_items
		if @cart_items.blank?
			redirect_to cart_items_path
		end
	end

end
