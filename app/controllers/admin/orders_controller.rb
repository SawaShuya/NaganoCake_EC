class Admin::OrdersController < Admin::Base

	def index
		@order = Order.all
	end

	def show
	end

	def update
	end

end
