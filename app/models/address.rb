class Address < ApplicationRecord
	belongs_to :end_user

	validates :postal_code, presence: true
	validates :destination, presence: true
	validates :consignee, presence: true
end
