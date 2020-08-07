Rails.application.routes.draw do

	scope module: :public do
		devise_for :end_users, controllers:{
			sessions: "public/end_users/sessions",
			registrations: "public/end_users/registrations",
      passwords: "public/end_users/passwords"
		}
  		# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  		root "homes#top"
      get "about" => "homes#about", as: "about"
      resources :end_users, only: [:show, :edit]
      resources :items, only: [:show, :index]
  	end


  	namespace :admin do
  		devise_for :admins, path: "", controllers:{
  			sessions: "admin/admins/sessions",
			  registrations: "admin/admins/registrations"
  		}
  	end
end
