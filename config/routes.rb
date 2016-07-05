Rails.application.routes.draw do
  resources :resources
  root 'resources#index'

  get 'auth/twitter/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: :signout
end
