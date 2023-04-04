# frozen_string_literal: true

Rails.application.routes.draw do
  root 'bulletins#index'
  # BEGIN
  get 'bulletins/', to: 'bulletins#index'
  resources :bulletins, only: [:index, :show]
  # END
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
