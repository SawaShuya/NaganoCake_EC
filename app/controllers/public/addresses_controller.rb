class Public::AddressesController < ApplicationController
	before_action :authenticate_end_user!
	before_action :set_address, only: [:index, :edit]
	before_action :set_addresses, only: [:index]
	def index; end

	def edit; end

	def create
		@address = current_end_user.addresses.new(address_params)
		if @address.save
			flash[:notice] = "create new address successflly"
			redirect_to addresses_path
		else
			flash[:notice] = "cannot create new address"
			set_addresses
			render "index"
		end

	end

	def update; end

	def destroy; end

	def address_params
		params.require(:address).permit(:consignee, :postal_code, :destination)
	end

	def set_address
		@address = Address.find_or_initialize_by(id: params[:id])
	end

	def set_addresses
		@addresses = Address.where(end_user_id: current_end_user.id)
	end
end
