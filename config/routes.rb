Rails.application.routes.draw do

  devise_for :users

  root "roulettes#active"

  resources :users, only: [:show, :index]

  resources :charges, except: [:index, :edit, :update, :destroy]

  resources :roulettes, except: [:index, :edit, :update, :destroy] do
    resources :bets, except: [:index, :show, :edit, :update, :destroy]
    get :active, :finished, on: :collection
  end

end
