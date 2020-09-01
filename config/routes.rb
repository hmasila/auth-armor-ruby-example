Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
  namespace :v1, defaults: { format: :json } do
    resources :users, only: [:new, :create, :show]
  end
end
