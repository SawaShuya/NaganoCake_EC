class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
		if resource == :end_user
			end_user_path(current_user.id)

		elsif resource == :admin

		end

	end

	 def configure_permitted_parameters
		 if resource == :end_user
      		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, ])
      	end
    end
end
