class Public::AddressesController < Public::Base
	def index
		@address = Address.new
		@addresses = Address.all
	end

	def edit
	end

	def create
		@address = Address.new(address_params)
		@address.end_user_id = current_end_user.id
		if @address.save
			flash[:notice] = "create new address successflly"
			redirect_to addresses_path
		else
			flash[:notice] = "cannot create new address"
			@addresses = Address.all
			render "index"
		end

	end

	def update
	end

	def destroy
	end

	def address_params
		params.require(:address).permit(:consignee, :postal_code, :destination)
	end

end
