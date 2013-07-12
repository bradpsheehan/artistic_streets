ArtisticStreets::Application.routes.draw do
  get '/discover', to: 'arts#index'
  # post '/arts/instagram', to: 'arts#instagram_art'
  # get '/arts/instagram', to: 'arts#verify_instagram_art'
  get '/i18n' => 'i18n#update'
  resources :arts, only: [:new, :index, :show, :create, :update]

  root :to => 'application#landing_page'
end
