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

    get '/tee_times' => 'teetimes#golfer_tee_time_index'
    get '/tee_times/:id' => 'teetimes#golfer_tee_time_show'
    post '/tee_times' => 'teetimes#golfer_tee_time_create' 

    get '/caddy_tee_times' => 'teetimes#caddy_tee_time_index'
    get '/caddy_tee_times/:id' => 'teetimes#caddy_tee_time_show'
    post '/caddy_tee_times' => 'teetimes#caddy_tee_time_confirm' 
  end


end
