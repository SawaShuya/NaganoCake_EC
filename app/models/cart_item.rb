class CartItem < ApplicationRecord
	belongs_to :end_user
	belongs_to :item

	validates :amount, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}

	def subtotal
		self.item.taxed * self.amount
	end

	def self.already_regitered(item_id, end_user, amount)
		cart_item = self.find_by(item_id: item_id, end_user_id: end_user.id)
		if cart_item.present?
			total_amount = cart_item.amount + amount
		end
		return cart_item, total_amount
	end
end
