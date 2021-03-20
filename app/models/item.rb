class Item < ApplicationRecord

	belongs_to :genre
	has_many :cart_items
	has_many :order_details
	attachment :item_image

	validates :name, presence: true
	validates :non_taxed_price, presence: true

	def self.search(search)
		if search
			@genre = Genre.find_by(['name LIKE ?', "%#{search}%"])
			if @genre.present?
				Item.where(['name LIKE ?', "%#{search}%"]).or(Item.where(genre_id: @genre.id))
			else
				Item.where(['name LIKE ?', "%#{search}%"])
			end
		else
			Item.all
		end
	end

	def taxed
		(self.non_taxed_price * 1.1).ceil
	end

end
