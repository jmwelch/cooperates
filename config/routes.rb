Cooperates::Application.routes.draw do
  resources :activities
  resources :friendships
  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions" }

  resources :users do 
    collection { get :search, to: 'users#search', :as => 'users_search' }
    collection { post :import }
  end

	match 'users/:id/food' => 'foods#index', :as => :foods_show
	match 'users/:id/ingredients' => 'ingredients#index', :as => :ingredient_show
	match 'users/:id/inventory' => 'stocks#index', :as => :stock_show
	match 'users/:id/inventory/csv' => 'stocks#csv', :as => :stocks_csv

  resources :users
  resources :foods
  resources :ingredients
	resources :stocks

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
	match 'users/search' => 'users#search'
	match 'users/:id/food/new' => 'foods#new', :as => 'new_food'
	match 'users/:id/ingredient/new' => 'ingredients#new', :as => 'new_ingredient'
	match 'users/:id/inventory/new' => 'stocks#new', :as => 'new_stock'
  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end  
  
  #authenticated :user do
  #  root :to => "users#index"
  #end
  root :to => 'welcome#index'
  
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html. 
  # root :to => 'welcome#index'
  # root :to => 'users#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
