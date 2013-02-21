Tuner::Application.routes.draw do
 root :to => 'home#index'



get '/login' => 'session#new'
post '/login' => 'session#create'
delete '/login' => 'session#destroy'


resources :users, :except => [:edit] do
  collection do
    get 'edit'
  end
end

resources :genres
resources :albums
resources :artists



end

