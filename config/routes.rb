Rails.application.routes.draw do
 
  post 'caddy_token' => 'caddy_token#create'
  post 'golfer_token' => 'golfer_token#create'

  namespace :api do
    get '/caddies' => 'caddies#index'
    get '/caddies/:id' => 'caddies#show'
    post '/caddies' => 'caddies#create'
    patch '/caddies/:id' => 'caddies#update'
    delete '/caddies/:id' => 'caddies#destroy'

    get '/golfers' => 'golfers#index'
    get '/golfers/:id' => 'golfers#show'
    post '/golfers' => 'golfers#create'
    delete '/golfers/:id' => 'golfers#destroy'

    get '/tee_times' => 'tee_times#index'
    get '/tee_times' => 'tee_times#show'

  end


end
