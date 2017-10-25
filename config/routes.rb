Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :companies
  namespace :api do
    namespace :v1 do
      resources :companies
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
