require "rails_helper"

RSpec.describe 'Movies API', type: :request do
    describe "happy path" do
    it 'returns a successful response with top-rated movies', :vcr do
        VCR.use_cassette('tmdb_top_rated') do
        get '/api/v1/movie/top_rated'
        expect(response).to have_http_status(:ok) 

        json_response = JSON.parse(response.body, symbolize_names: true)

        expect(json_response).to have_key(:movies)
        expect(json_response[:movies]).to be_an(Array)
    
        movies = json_response[:movies]
        expect(movies.count).to be <= 20 

        first_movie = movies.first[:data]  
        expect(first_movie[:type]).to eq("movie")
        expect(first_movie[:attributes]).to have_key(:title)
        expect(first_movie[:attributes]).to have_key(:vote_average)
        expect(first_movie).to have_key(:id)
        end
    end
    end
end