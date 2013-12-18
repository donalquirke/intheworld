Intheworld::Application.routes.draw do
  post "sessions/destroy"
  post "sessions/new"
  
  get "users/daily_intention"
  
  post "intentions/chosen"
  post "intentions/unchosen"
  
  resources :intentions
  resources :users
  resources :sessions
  resources :registerations
  
  match 'login' => 'sessions#new' 
  match 'logout' => 'sessions#destroy'  
  match 'intentions/:id' => 'intentions#show'
  match 'get_started' => 'sessions#get_started'

  #root :to => redirect('/intentions')
  root :to => redirect('/get_started')
  
  
end

