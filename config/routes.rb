Rails.application.routes.draw do
  resources :heroine_powers
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :create]  
end
