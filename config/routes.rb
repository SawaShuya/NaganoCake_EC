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
      patch "end_users/withdrawal" => "end_users#withdrawal_process", as: "withdrawal"

      resources :items, only: [:show, :index]

      delete "cart_items/destroy_all" => "cart_items#destroy_all", as: "destroy_all"
      resources :cart_items, only: [:index, :update, :destroy, :create]

      post "orders/confirm" => "orders#confirm", as: "order_confirm"
      get "orders/finish" => "orders#finish", as: "order_finish"
      resources :orders, only: [:new, :create]

       resources :addresses, only: [:index, :create]
  end


	namespace :admin do

      get "/" => "homes#top", as: "top"

      resources :end_users, only: [:index, :show, :edit, :update]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :items, only: [:index, :new, :create, :show, :edit, :update]
      resources :orders, only: [:index, :show, :update]
	end
end
