class Admin::Admins::ApplicationController < ApplicationController
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
			end_user_path(current_user.id)
	end

	 def configure_permitted_parameters
      		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, 
      			:kana_last_name, :kana_first_name, :postal_code, :address, :telephone_number])
     end
end
