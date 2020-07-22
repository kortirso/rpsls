# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :users do
        resources :devices, only: %i[create]
        resources :sessions, only: %i[create]
      end
      resources :calls, only: %i[create]
    end
  end
end
