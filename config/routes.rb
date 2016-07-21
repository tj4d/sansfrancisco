Rails.application.routes.draw do
  resources :jobs
  resources :publications do 
	  member do
	    get "like", to: "publications#like"
	    get "unlike", to: "publications#unlike"
	  end
	end
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
