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

	accepts_nested_attributes_for :order_details


	def set_address(user, address_option, address_id)

		if address_option == 0
			self.consignee = user.last_name + user.first_name
			self.postal_code = user.postal_code
			self.destination_address = user.address

		elsif address_option == 1
			address = Address.find(address_id)
			self.consignee = address.consignee
			self.postal_code = address.postal_code
			self.destination_address = address.destination
		elsif address_option == 2
		end
	end
	def postage
		@postage = 800
	end

	def view_address
		"〒" + self.postal_code + '  ' + self.destination_address + '  ' + self.consignee
	end

	def all_change_status_to_waiting
		self.order_details.each do |detail|
			if detail.production_status == "unavailable"
				detail.update(production_status: "waiting_for_production")
			end
		end
	end

	def finish_making?
		self.order_details.where(production_status: ["unavailable", "waiting_for_production", "making"] ).blank?
	end
end
