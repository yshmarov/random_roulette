Rails.application.routes.draw do
  devise_for :users
  root "piggy_banks#active"
  resources :charges, only: [:new, :create]
  resources :piggy_banks, except: [:index, :edit, :update, :destroy] do
    resources :shares, except: [:index, :show, :edit, :update, :destroy]
    get :active, :finished, on: :collection
  end
  resources :users, only: [:show, :index]
end
