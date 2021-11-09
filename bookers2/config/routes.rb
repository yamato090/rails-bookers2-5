Rails.application.routes.draw do
  devise_for :users
  root "homes#top"

  get "/home/about" => "homes#about"
  resources :users do
    resource :relationships, only: [:create, :destroy]
      get :follows, on: :member
      get :followers, on: :member
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
      resources :book_comments, only: [:create, :destroy]
  end
  get '/search', to: 'searchs#search'
end


