class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@orders = Order.all.includes([:end_user, :order_details])
	end

	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details.includes(:item)
	end

	def update
		order = Order.find(params[:id])
		if order.update(status: params[:order][:status])
			if params[:order][:status] == "confilm_payment"
				order.all_change_status_to_waiting
			end
		end
		redirect_to admin_order_path(order)
	end

end
