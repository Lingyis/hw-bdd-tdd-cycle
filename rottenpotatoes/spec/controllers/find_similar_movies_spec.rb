require 'rails_helper'

describe MoviesController do
  # Test Get similar movies route
  describe 'similar movies' do
    before :each do
      @famous_movie = Movie.create(title: 'Famous Movie', director: 'Famous Director', release_date: '1990-01-01', rating: 'PG-13')
      @no_director_movie = Movie.create(title: 'Directorless', release_date: '1990-01-01', rating: 'R')
      @fake_results = [double('Famous Movie 1'), double('Famous Movie 2')]
    end
    it 'should call the model method that performs the TMDb director search' do
      expect(Movie).to receive(:search_by_director).and_return(@fake_results)
      get :find_similar_movies, {title: 'Famous Movie'}
    end
    it 'should select the find_similar_movie for rendering' do
      allow(Movie).to receive(:search_by_director).and_return(@fake_results)
      get :find_similar_movies, {title: 'Famous Movie'}
      expect(response).to render_template('find_similar_movies')
    end
    it 'should make search result available to that template' do
      allow(Movie).to receive(:search_by_director).and_return(@fake_results)
      get :find_similar_movies, {title: 'Famous Movie'}
      expect(assigns(:movies)).to be == @fake_results
    end
    # Now test cases when there is a director and when there isn't one
    it 'should return a list of movies if there is a director present' do
      get :find_similar_movies, {title: @famous_movie.title}
      expect(assigns(:movies).length).to be == 1
    end
    it 'should return no movies if no director info for selected movie' do
      get :find_similar_movies, {title: @no_director_movie.title}
      expect(assigns(:movies)).to be == nil
    end
  end
end