Rails.application.routes.draw do
  resources :powers #, only: [:index]
  resources :heroines #, only: [:index]

  get '/search', to: 'heroines#search' #I am not sure this is the correct route.
  #Attempting to redirect to the index but with filtered results...not sure how
end
