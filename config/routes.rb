Rails.application.routes.draw do

  get '/' => 'recipes#index'
  post '/recipes/:recipe_id/comments', to: 'comments#create'
  get '/recipes/:recipe_id/comments/new', to: 'comments#new', as: 'new_recipe_comment'
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

  post '/comments/:comment_id/comments', to: 'comments#create'
  get '/comments/:comment_id/comments/new', to: 'comments#new', as: 'new_comment_comment'
  get '/comments' => 'comments#index'
  get '/comments/new' => 'comments#new'
  post '/comments' => 'comments#create'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/user' => 'users#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/notes/new' => 'notes#new'
  post '/notes' => 'notes#create'
  

end
