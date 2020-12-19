Rails.application.routes.draw do

  devise_for :users

  root "roulettes#active"

  resources :users, only: [:show, :index]

  resources :charges, except: [:index, :edit, :update, :destroy]

  resources :roulettes, except: [:create, :new, :index, :edit, :update, :destroy] do
    get :active, :finished, on: :collection
    member do
      patch :gamble
    end
  end

end
