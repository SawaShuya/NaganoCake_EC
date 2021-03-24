class Genre < ApplicationRecord

	validates :name, presence: true
	has_many :items

	def display
		if self.is_active == true
			'有効'
		else
			'無効'
		end
	end
end
