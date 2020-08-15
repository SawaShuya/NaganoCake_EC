class Item < ApplicationRecord

	belongs_to :genre
	has_many :cart_items
	attachment :item_image

	validates :name, presence: true
	validates :non_taxed_price, presence: true

end
