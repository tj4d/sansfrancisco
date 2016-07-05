Rails.application.routes.draw do
  resources :resources do 
	  member do
	    put "like", to: "resources#like"
	    put "unlike", to: "resources#unlike"
	  end
	end
  root 'resources#index'

  get 'auth/twitter/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: :signout

end
