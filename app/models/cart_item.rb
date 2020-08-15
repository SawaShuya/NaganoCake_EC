class CartItem < ApplicationRecord
	belongs_to :end_user
	belongs_to :item

	validates :amount, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
end
