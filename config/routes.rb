Rails.application.routes.draw do
	resources :users
	resources :resources do
  	member do
    	get "like", to: "resources#like"
    	get "unlike", to: "resources#unlike"
  	end
	end
	root 'resources#index'

	get 'auth/twitter', as: :signin
	get 'auth/twitter/callback', to: 'sessions#create'
	get 'auth/failure', to: "resources#index"
	get '/signout', to: 'sessions#destroy', as: :signout
	get '/privacy', to: 'pages#privacy'
	get '/terms', to: 'pages#terms'
end
