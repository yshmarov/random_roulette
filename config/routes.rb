Rails.application.routes.draw do
  devise_for :users
  root "roulettes#active"
  resources :charges, except: [:index, :edit, :update, :destroy]
  resources :roulettes, except: [:index, :edit, :update, :destroy] do
    resources :shares, except: [:index, :show, :edit, :update, :destroy]
    get :active, :finished, on: :collection
  end
  resources :users, only: [:show, :index]
end
