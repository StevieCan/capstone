Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  post 'users' => 'users#create'

  namespace :api do
    get '/caddies' => 'caddies#index'
    get '/caddies/:id' => 'caddies#show'
    post '/caddies' => 'caddies#create'
    patch '/caddies/:id' => 'caddies#update'
    delete '/caddies/:id' => 'caddies#destroy'

    get '/golfers' => 'golfers#index'
    get '/golfers/:id' => 'golfers#show'
  end


end
