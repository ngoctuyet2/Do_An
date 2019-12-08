Rails.application.routes.draw do
	namespace :admin do
	  	devise_for :users, skip: :all
	  	devise_for :users, controllers: { sessions: 'admin/users/sessions' }
	  	get 'products', to: 'products#index', as: 'products'
	  	get 'products/new', to: 'products#new', as: 'new_products'
	  	get 'products/:id', to: 'products#show', as: 'product'
	  	get 'products/:id/edit', to: 'products#edit', as: 'edit_products'
	  	put '/products/:id', to: "products#update", as: 'update_products'
	  	delete '/products/:id', to: 'products#destroy', as: 'destroy_products'
	  	post '/products', to: "products#create", as: 'create_products'


	  	get 'categories', to: 'categories#index', as: 'categories'
	  	get 'categories/new', to: 'categories#new', as: 'new_categories'
	  	get 'categories/:id', to: 'categories#show', as: 'category'
	  	get 'categories/:id/edit', to: 'categories#edit', as: 'edit_categories'
	  	put '/categories/:id', to: "categories#update", as: 'update_categories'
	  	delete '/categories/:id', to: 'categories#destroy', as: 'destroy_categories'
	  	post '/categories', to: "categories#create", as: 'create_categories'
		root to: 'products#index'	

		get 'users', to: 'users#index', as: 'users'
	  	get 'users/new', to: 'users#new', as: 'new_users'
	  	get 'users/:id', to: 'users#show', as: 'user'
	  	get 'users/:id/edit', to: 'users#edit', as: 'edit_users'
	  	put '/users/:id', to: "users#update", as: 'update_users'
	  	delete '/users/:id', to: 'users#destroy', as: 'destroy_users'
	  	post '/users', to: "users#create", as: 'create_users'

	  	get 'posts', to: 'posts#index', as: 'posts'
	  	get 'posts/new', to: 'posts#new', as: 'new_posts'
	  	get 'posts/:id', to: 'posts#show', as: 'post'
	  	get 'posts/:id/edit', to: 'posts#edit', as: 'edit_posts'
	  	put '/posts/:id', to: "posts#update", as: 'update_posts'
	  	delete '/posts/:id', to: 'posts#destroy', as: 'destroy_posts'
	  	post '/posts', to: "posts#create", as: 'create_posts'
	end
	devise_for :users
	resources :products
	resources :users
	post '/create_comment', to: 'products#create_comment'
	get '/get_comment', to: 'products#get_comment'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'products#index'
end
	