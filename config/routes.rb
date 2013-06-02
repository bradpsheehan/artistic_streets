ArtisticStreets::Application.routes.draw do

  root :to => 'application#landing_page'

  get '/discover', to: 'arts#index'
  resources :arts

end
