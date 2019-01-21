Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'auth/:provider/callback' => 'users#create'#このpathを通して認証が行われる。
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/auth/logout', to: 'sessions#destroy'
  
  resources :users, only: [:index, :show, :new, :create]
  resources :posts, only: [:create, :destroy]
end
