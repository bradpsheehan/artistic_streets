ArtisticStreets::Application.routes.draw do
  get '/discover', to: 'arts#index'
  
  # post '/arts/instagram', to: 'arts#instagram_art'
  # get '/arts/instagram', to: 'arts#verify_instagram_art'

  get '/images', to: 'images#index', as: 'gallery'

  get '/i18n' => 'i18n#update'
  resources :arts, only: [:index, :show, :create]
  resources :images, only: [:create]
  
  root :to => 'application#landing_page'
end
