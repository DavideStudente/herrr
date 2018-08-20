Rails.application.routes.draw do

  resources :consoles
  resources :games

  default_url_options :host => "localhost:3000"
  root 'static_pages#home'

  get 'password_resets/new'
  get 'password_resets/edit'


  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/home',   to: 'static_pages#home'
  #gamer
  get  '/signup',  to: 'gamers#new'
  #session
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/attributes', to: 'account_attributes#new'
  post '/attributes', to: 'account_attributes#create'

  #oauth
  get 'loginGoogle', to: redirect('/auth/google_oauth2') # , as: 'login'
  get 'logoutGoogle', to: 'sessions#destroy' # , as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create_by_google_oauth'
  get 'auth/failure', to: redirect('/')

  #arena
  get '/arena',  to: 'arena_pages#arena'
  get '/changerole', to: 'arena_pages#changerole'

  resources :teams do
    get 'join'
    get 'leave'
  end
  resources :groups
  resources :gamers
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :account_attributes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
