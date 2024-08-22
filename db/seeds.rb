require 'json'
require 'open-uri'

puts 'Destroying all files'
Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies = URI.open(url).read
movie = JSON.parse(movies)
movie_result = movie['results']
movie_poster = 'https://image.tmdb.org/t/p/w500'

movie_result.each do |m|
  new_movie = Movie.create!(
    title: m['title'],
    overview: m['overview'],
    poster_url: movie_poster + m['poster_path'],
    rating: m['vote_average'].round(1)
  )
  puts "#{new_movie.title} has been created!"
end

puts Movie.count
