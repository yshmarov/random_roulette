Rails.application.routes.draw do
  devise_for :users
  root "static_pages#landing_page"
  resources :shares, except: [:show, :edit, :update, :destroy]
  resources :charges, except: [:show, :edit, :update, :destroy]
  resources :piggy_banks, except: [:edit, :update, :destroy]
end
