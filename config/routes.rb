Rails.application.routes.draw do

  get '/' => 'recipes#index'
  get '/recipes' => 'recipes#index'
  get '/recipes/new' => 'recipes#new'
  post '/recipes' => 'recipes#create'
  get '/recipes/:id' => 'recipes#show'
  get '/user_recipes' => 'recipes#user_recipes'
  get '/recipes/:id/edit' => 'recipes#edit'
  patch '/recipes/:id' => 'recipes#update'
  delete '/recipes/:id' => 'recipes#destroy'

  get '/ingredients/new' => 'ingredients#new'
  post '/ingredients' => 'ingredients#create'
  get '/ingredients/:id' => 'ingredients#show'
  delete '/ingredients/:id' => 'ingredients#destroy'

  get '/recipes/:id/brews/new' => 'brews#new'
  post '/brews' => 'brews#create'
  get '/brews/:id' => 'brews#show'

  get '/comments' => 'comments#index'
  get '/comments/new' => 'comments#new'
  post '/comments' => 'comments#create'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/user' => 'users#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
