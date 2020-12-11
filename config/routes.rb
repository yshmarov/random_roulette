Rails.application.routes.draw do
  resources :charges
  devise_for :users
  root "static_pages#landing_page"
  resources :piggy_banks
end
