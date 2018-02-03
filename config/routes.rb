Rails.application.routes.draw do

  root to: "homes#index"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :organizations, only:[:index,:create,:show]

  namespace :admin do
    resources :dashboards
    resources :needs
  end

  # get '/rank', to: 'organizations#rank', as: "rank"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
