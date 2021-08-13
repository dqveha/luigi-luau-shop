Rails.application.routes.draw do
  root to: 'index#index'

  get '/index' => 'index#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  get '/products/most' => 'products#most'
  get '/products/recent' => 'products#recent'
  get '/products/us' => 'products#us'
  
  resources :users
  resources :products do
    resources :reviews
  end
end
