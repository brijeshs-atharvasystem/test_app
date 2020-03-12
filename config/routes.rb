Rails.application.routes.draw do

  resources :answers
  resources :topics
  resources :questions
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#questions'

  resources :home, only: [:index] do
    collection do
      get :questions
    end
  end

  resources :followers, only: [] do
    member do
      post :follow_user
      post :follow_topic
    end
  end
end
