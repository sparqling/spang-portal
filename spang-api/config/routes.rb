Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'library#index'
  resources :library, only: [:index, :show]
  namespace :api do
    resources :library, only: [:index, :show]
  end
end
