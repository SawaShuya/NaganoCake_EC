class Item < ApplicationRecord

	belongs_to :genre
	has_many :cart_items
	has_many :order_details
	attachment :item_image

	validates :name, presence: true
	validates :non_taxed_price, presence: true

	def self.search(search)
		if search
			Item.where(['name LIKE ?', "%#{search}%"])
		else
			Item.all
		end
	end

end
