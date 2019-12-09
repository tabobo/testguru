# frozen_string_literal: true

Rails.application.routes.draw do
  root 'questions#index'

  resources :tests do
    resources :questions
  end

  # get 'tests/1/questions/:body', to: 'questions#search'
end
