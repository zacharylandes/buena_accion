Rails.application.routes.draw do

  root to: "organizations#index"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :organizations, only:[:index,:create,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
