Rails.application.routes.draw do
	scope module: :public do
		devise_for :end_users
  		# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	end


  	namespace :admin do
  		devise_for :admins, path: ""
  	end
end
