# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  resources :posts do
    scope module: :posts do
      resources :comments, only: [:create]
    end
  end

  scope module: :posts do
    resources :comments, only: [:edit, :update, :destroy] 
  end
end
