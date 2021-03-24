class Item < ApplicationRecord

	belongs_to :genre
	has_many :cart_items
	has_many :order_details
	attachment :item_image

	validates :name, presence: true
	validates :non_taxed_price, presence: true

	def self.search(search)
		if search
			genre_ids = Genre.where(['name LIKE ?', "%#{search}%"]).pluck(:id)
			if genre_ids.present?
				Item.where(['name LIKE ?', "%#{search}%"]).or(Item.where(genre_id: [genre_ids])).includes(:genre)
			else
				Item.where(['name LIKE ?', "%#{search}%"]).includes(:genre)
			end
		else
			Item.all.includes(:genre)
		end
	end

	def taxed
		(self.non_taxed_price * 1.1).floor(1).ceil
	end

end
