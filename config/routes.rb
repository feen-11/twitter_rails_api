# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'users'
      get 'users', to: 'devise_token_auth/registrations#new'
    end
  end
end
