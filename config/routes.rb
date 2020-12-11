Rails.application.routes.draw do
  resources :charges, except: [:show, :edit, :update, :destroy]
  devise_for :users
  root "static_pages#landing_page"
  resources :piggy_banks
end
