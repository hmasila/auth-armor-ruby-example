# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: { format: :json } do
    namespace :auth do
      scope '/autharmor' do
        post '/invite', to: 'autharmor#invite'
        post '/confirm', to: 'autharmor#confirm'
        post '/auth', to: 'autharmor#auth'
        get '/logout', to: 'autharmor#logout'
        get '/me', to: 'autharmor#me'
      end
    end
  end
end
