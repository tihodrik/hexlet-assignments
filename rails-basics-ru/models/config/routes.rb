# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'
  # BEGIN
  resources :articles, only: [ :index, :show ]
  # END
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
