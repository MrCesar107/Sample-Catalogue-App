# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :catalogues, except: %i[edit] do
    resource :restore_catalogue, only: %i[update],
                                 controller: 'catalogues/restore_catalogue'
    resources :sections, except: %i[edit show],
                         controller: 'catalogues/sections' do
      resources :products, controller: 'catalogues/sections/products'
    end
  end

  resources :sections, only: %i[index show] do
    resource :activation, only: %i[create], controller: 'sections/activations'
  end
  resources :products, only: %i[index show]

  root to: 'dashboard#index'
end
