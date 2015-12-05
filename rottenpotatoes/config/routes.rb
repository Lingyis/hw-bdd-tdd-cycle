Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get  '/find_similar_movies/:title', to: 'movies#find_similar_movies', as: :find_similar_movies
end
