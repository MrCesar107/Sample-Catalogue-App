# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :catalogues, except: %i[edit] do
    resources :sections do
      resources :products
    end
  end

  root to: 'dashboard#index'
end
