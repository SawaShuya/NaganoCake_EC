class Public::OrdersController < Public::Base
	def new
		@order = Order.new
		@addresses = Address.all
	end

	def confirm
		@cart_items = CartItem.where(end_user_id: current_end_user.id)
		@order = Order.new(order_params)
		@order.postage = 800
		@order.total_payment = @total_payment
		if params[:order][:address_option] == "0"
			@order.consignee = current_end_user.last_name + current_end_user.first_name
			@order.postal_code = current_end_user.postal_code
			@order.destination_address = current_end_user.address

		elsif params[:order][:address_option] == "1"
		elsif params[:order][:address_option] == "2"
		end



	end

	def finish
	end

	def create
		@order = Order.new(order_params)
		@order.end_user_id = current_end_user.id
		if @order.save
			flash[:notice] = "create oreder successfully"
			redirect_to order_finish_path
		else
			flash[:notice] = "cannnot create oreder"
			redirect_to new_order_path
		end
	end

	def index
	end

	def show
	end



	private
	def order_params
		params.require(:order).permit(:end_user_id, :payment_method, :total_payment, :postal_code, :destination_address, :consignee, :address_option, :postage)
	end

end
