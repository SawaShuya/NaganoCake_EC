class Admin::OrderDetailsController < ApplicationController
	before_action :authenticate_admin!

	def update
		order_detail = OrderDetail.find(params[:id])

		if order_detail.update(production_status: params[:order_detail][:production_status])
			order_detail.change_order_status(params[:order_detail][:production_status])
		end

		redirect_to admin_order_path(order_detail.order)
	end
end
