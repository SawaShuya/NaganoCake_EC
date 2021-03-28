class OrderDetail < ApplicationRecord
	belongs_to :item
	belongs_to :order

	enum production_status: {
		unavailable: 0,
		waiting_for_production: 1,
		making: 2,
		completion: 3,
	}

	def change_order_status(production_status)
		order = self.order

		if production_status == "making"
			if order.status == "confilm_payment"
				order.update(status: "making")
			end
		elsif production_status == "completion"
			if order.finish_making?
				order.update(status: "prepare_shipping")
			end
		end
	end

end
