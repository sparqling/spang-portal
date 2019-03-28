Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'library#index'
  get 'library/search', to: 'library#search_template', as: 'library_search_template'
  resources :library, only: [:index, :show]
  get "library/:library_id/:template_id", to: 'library#show_template', as: 'library_show_template'
  namespace :api do
    resources :library, only: [:index, :show]
  end
end
