Intheworld::Application.routes.draw do
  post "sessions/destroy"
  get "sessions/menu"
  
  get "users/daily_intention"
  
  post "intentions/chosen"
  post "intentions/unchosen"
  get "intentions/gallery"
  
  resources :intentions
  resources :users
  resources :sessions
  resources :registerations
  
  match 'login' => 'sessions#new' 
  match 'logout' => 'sessions#destroy'  
  match 'app_landing' => 'sessions#app_landing'
  match 'intentions/:id' => 'intentions#show'
  match 'get_started' => 'sessions#get_started'

  #root :to => redirect('/intentions')
  root :to => redirect('/get_started')
  
  
end

