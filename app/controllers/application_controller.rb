class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_end_user!, except: [:top, :about]

	def after_sign_in_path_for(resource)
		if resource == :end_user
			end_user_path(current_user.id)

		elsif resource == :admin

		end

	end

	private

	 def configure_permitted_parameters
		 if resource == :end_user
      		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, 
      			:kana_last_name, :kana_first_name, :postal_code, :address, :telephone_number])
      	end
    end
end
