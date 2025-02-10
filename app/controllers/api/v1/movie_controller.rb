class Api::V1::MovieController < ApplicationController
    def top_rated
        movies = MovieGateway.top_rated_movies
        formatted_movies = movies.map { |movie| MovieSerializer.format_movie(movie) }
        render json: { movies: formatted_movies }
    end
end