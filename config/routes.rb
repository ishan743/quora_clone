Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'comments/create'
  get 'comments/destroy'
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :posts do
    member do
      post :like
      post :dislike
    end
    resources :comments, only: [:create, :destroy]
  end
  
  root 'posts#index'
end
