require 'rails_helper'

    RSpec.describe MovieGateway do
        describe '.top_rated_movies' do
        it 'returns an array of top-rated movies with expected attributes', :vcr do 
            movies = MovieGateway.top_rated_movies
    
            expect(movies).to be_an(Array)
            expect(movies.size).to be <= 20 
    
            first_movie = movies.first
            expect(first_movie).to be_a(Hash)
            expect(first_movie).to have_key(:title)
            expect(first_movie).to have_key(:vote_average)
            expect(first_movie).to have_key(:id)
            end
        end
    end
