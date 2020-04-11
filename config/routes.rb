Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update]
  # Adding the destroy route means we have reveal all auto created from the code below:
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
