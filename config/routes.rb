ArtisticStreets::Application.routes.draw do

  root :to => 'application#landing_page'

  get '/discover', to: 'arts#index'

  post '/arts/instagram', to: 'arts#instagram_art'
  get '/arts/instagram', to: 'arts#verify_instagram_art'

  resources :arts
end
