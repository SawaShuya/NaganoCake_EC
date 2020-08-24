class Public::OrdersController < Public::Base
	def new
		@order = Order.new
		@addresses = Address.all
	end

	def confirm
		@cart_items = CartItem.where(end_user_id: current_end_user.id)
		@order = Order.new(order_params)
		# 送料は固定で800
		@order.postage = 800
		# total_paymentはhtmlのほうで計算
		@order.total_payment = @total_payment
		# addres_optionによって宛名、郵便番号、住所を指定
		if params[:order][:address_option] == "0"
			@order.consignee = current_end_user.last_name + current_end_user.first_name
			@order.postal_code = current_end_user.postal_code
			@order.destination_address = current_end_user.address

		elsif params[:order][:address_option] == "1"
			address = Address.find(params[:order][:id])
			@order.consignee = address.consignee
			@order.postal_code = address.postal_code
			@order.destination_address = address.destination
		elsif params[:order][:address_option] == "2"
		end



	end

	def finish
	end

	def create
		@order = Order.new(order_params)
		@order.end_user_id = current_end_user.id

		cart_items = CartItem.where(end_user_id: current_end_user.id)
		# ordersテーブルを保存して、保存ができたらorder_detailsテーブルを保存
		if @order.save
			# カートから商品id、個数を取得して、金額はitemsテーブルから取得
			cart_items.each do |cart_item|
				order_detail = OrderDetail.new
				order_detail.order_id = @order.id
				order_detail.item_id = cart_item.item_id
				order_detail.amount = cart_item.amount
				order_detail.non_taxed_price = Item.find(cart_item.item_id).non_taxed_price
				if order_detail.save
					flash[:notice] = "create oreder & detail successfully"
				else
					flash[:notice] = "create only oreder successfully"
				end
			end
			# カートの中の商品を削除
			cart_items.destroy_all
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
