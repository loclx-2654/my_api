# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'signin', to: 'logins#login'
      end
      resources :users
    end
  end
end
