class Admin::OrderDetailsController < ApplicationController
	def update
		order_detail = OrderDetail.find(params[:id])
		order = order_detail.order

		if order_detail.update(production_status: params[:order_detail][:production_status])
			if params[:order_detail][:production_status] == "making"
				if order.status == "confilm_payment"
					order.update(status: "making")
				end
			elsif params[:order_detail][:production_status] == "completion"
				if order.order_details.where(production_status: ["unavailable", "waiting_for_production", "making"] ).blank?
					order.update(status: "prepare_shipping")
				end
			end
		end

		redirect_to admin_order_path(order)
	end
end
