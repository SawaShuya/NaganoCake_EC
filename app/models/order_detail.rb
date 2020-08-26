class OrderDetail < ApplicationRecord
	belongs_to :item
	belongs_to :order

	enum production_status: {
		unavailable: 0,
		waiting_for_production: 1,
		making: 2,
		completion: 3,
	}
end
