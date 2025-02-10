class MovieGateway
    def self.top_rated_movies
        conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
            faraday.headers["Authorization"] = "Bearer #{Rails.application.credentials.tmdb[:key]}"     
        end

        response = conn.get("/3/movie/top_rated")

        json = JSON.parse(response.body, symbolize_names: true)
        json[:results].first(20)
    end
end



