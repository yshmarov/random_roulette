Rails.application.routes.draw do
  devise_for :users
  root "static_pages#landing_page"
  resources :piggy_banks
end
