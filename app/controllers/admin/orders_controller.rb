class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@order = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

	def update
		order = Order.find(params[:id])
		if order.update(status: params[:order][:status])

			order_details = order.order_details

			if params[:order][:status] == "confilm_payment"
				order_details.each do |detail|
					if detail.production_status == "unavailable"
						detail.update(production_status: "waiting_for_production")
					end
				end
			end
		end
		redirect_to admin_order_path(order)
	end

end
