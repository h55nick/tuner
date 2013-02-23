Tuner::Application.routes.draw do
 root :to => 'home#index'



get '/login' => 'session#new'
post '/login' => 'session#create'
delete '/login' => 'session#destroy'

post "/song/purchase/" => 'users#purchase', :as => 'purchase'

resources :users

resources :genres
resources :artists
resources :songs
resources :mixtapes


end

