require 'rails_helper'

describe Movie do
  describe 'search by director' do
    before :each do
      @star_wars = Movie.create(title: 'Star Wars', rating: 'PG', director: 'George Lucas', release_date: '1997-05-25')
      @blade_runner = Movie.create(title: 'Blade Runner', rating: 'PG', director: 'Ridley Scott', release_date: '1982-06-25')
      @alien = Movie.create(title: 'Alien', rating: 'R', release_date: '1979-05-25')
      @thx = Movie.create(title: 'THX-1138', rating: 'R', director: 'George Lucas', release_date: '1971-03-11')
    end
    it 'should be able to search by director' do
      lucas_movies = Movie.search_by_director('George Lucas')
      expect(lucas_movies.length).to be == 2
    end
    it 'should find movies by the same director' do
      lucas_movies = Movie.search_by_director('George Lucas')
      lucas_movies.each do |movie|
        expect(movie.director).to be == 'George Lucas'
      end
    end
    it 'should not find movies by different directors' do
      all_movies = Movie.search_by_director('Not George Lucas')
      all_movies.each do |movie|
        expect(movie.drector).to_not be == 'George Lucas'
      end
    end
  end
end
