class MovieSerializer
    def self.format_movie(movie_data)
        { data:
            {
            id: movie_data[:id].to_s,
            type: 'movie',
            attributes: {
                title: movie_data[:title],
                vote_average: movie_data[:vote_average]
                }
            }
        }
    end
end