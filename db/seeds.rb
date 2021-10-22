require 'open-uri'
require 'json'

url = 'http://tmdb.lewagon.com/movie/top_rated'
buffer = URI.open(url).read
top_movies = JSON.parse(buffer)["results"]

puts "Deleting database..."
Movie.destroy_all
puts "Database is empty."

puts "Creating new movies..."
top_movies.each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original/#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
end
puts "#{Movie.count} movies were added."