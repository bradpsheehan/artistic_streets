ArtisticStreets::Application.routes.draw do

  root :to => 'application#landing_page'

  get '/discover', to: 'arts#index'

  get '/count', to: 'arts#count'

  post '/arts/instagram', to: 'arts#instagram_art'
  get '/arts/instagram', to: 'arts#verify_instagram_art'

  get '/i18n' => 'i18n#update'

  resources :arts
end
