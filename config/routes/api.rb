# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signin', to: 'logins#login'
      resources :users
    end
  end
end
