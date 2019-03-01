Rails.application.routes.draw do
  resources :powers#, only: [:index]
  resources :heroines#, only: [:index]

  # I elected to comment out scoping down routes because
  # in the past, not allowing all routes to be open has
  # broken my code.
end
