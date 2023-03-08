Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  # match 'movies/:id/similar' => 'movies#similar', via: :get, as: :similar_movies

  #match 'movies/:id/similar' => 'movies#similar', :as => :similar_movies, via: :get

  get '/movies/:id/similar', to: 'movies#similar', as: 'similar_movies'




  resources :movies do
    get 'search_directors', on: :collection
  end
  root :to => redirect('/movies')
end
