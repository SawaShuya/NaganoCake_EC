class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_end_user!, except: [:top, :about]

	def after_sign_in_path_for(resource)
		if resource_name == :end_user
			my_page_path

		elsif resource_name == :admin
			admin_top_path

		end
	end

	def after_sign_out_path_for(resource)
		if resource_name == :end_user
			root_path

		elsif resource_name == :admin
			new_admin_session_path

		end
	end


	private

	 def configure_permitted_parameters
		 if resource_name == :end_user
      		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :telephone_number])
      	end
    end
end
