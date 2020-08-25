class Order < ApplicationRecord
	enum payment_method: {
		cash: 0,
		credit: 1,
	}

	enum status: {
		waiting_for_payment: 0,
		confilm_payment: 1,
		making: 2,
		prepare_shipping: 3,
		shipped: 4,
	}
	has_many :order_details
	belongs_to :end_user
end
