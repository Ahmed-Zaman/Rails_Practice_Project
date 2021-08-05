Rails.application.routes.draw do
  resources :books
  # get '/books', to: "books#index"
  # get '/partial', to: "books#_partial"
  # post '/save', to: "books#save"
  root "articles#index"
  
  resources :articles
  get "/articles", to: "articles#index"
  get "/articles/new", to: "articles#new"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 