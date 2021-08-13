Rails.application.routes.draw do
  root to: 'index#index'

  get '/index' => 'index#index'

  get '/products/most' => 'products#most'
  get '/products/recent' => 'products#recent'
  get '/products/us' => 'products#us'
  
  resources :products do
    resources :reviews
  end
end
