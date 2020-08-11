Rails.application.routes.draw do

    devise_for :end_users, controllers:{
      sessions: "public/end_users/sessions",
      registrations: "public/end_users/registrations",
      passwords: "public/end_users/passwords"
    }

      devise_for :admins, path: "admin", controllers:{
          sessions: "admin/admins/sessions",
          registrations: "admin/admins/registrations"
        }


	scope module: :public do

  		# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  		root "homes#top"
      get "about" => "homes#about", as: "about"

      get "end_users/my_page" => "end_users#show", as: "my_page"
      get "end_users/my_page/edit" => "end_users#edit", as: "edit_my_page"
      patch "end_users/my_page" => "end_users#update", as: "update_my_page"
      get "end_users/unsubscribe" => "end_users#unsubscribe", as: "unsubscribe"

      resources :items, only: [:show, :index]
  end


	namespace :admin do

      get "/" => "homes#top", as: "top"
	end
end
