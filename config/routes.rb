Rails.application.routes.draw do
  resources :minesweeper_boards
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'minesweeper_boards#new'
end
