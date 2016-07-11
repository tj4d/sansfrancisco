Rails.application.routes.draw do
  resources :resources do 
	  member do
	    get "like", to: "resources#like"
	    get "unlike", to: "resources#unlike"
	  end
	end
  root 'resources#index'

  get 'auth/twitter/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: :signout

end
