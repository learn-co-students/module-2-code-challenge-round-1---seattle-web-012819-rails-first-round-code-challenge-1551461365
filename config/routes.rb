Rails.application.routes.draw do
  resources :powers, only: [:index, :show, :new, :create]
  resources :heroines, only: [:index, :new, :show, :create]
end
