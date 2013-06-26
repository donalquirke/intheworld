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
  root :to => redirect('/intentions')
  #root :to => redirect('/login')
  
  
end

