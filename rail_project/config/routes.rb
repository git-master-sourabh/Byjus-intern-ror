Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "articles#index"

  get '/go' => 'travels#index'
  get '/search' => 'travels#search'
  
  
  resources :articles do
    resources :comments
  end
end
