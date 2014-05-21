require 'spec_helper'
describe 'View an individual movie' do


it "Shows a movie's details" do

    movie = Movie.create(movie_attributes(total_gross:600000000.00))

    #visit "http://www.localhost:3000/movies/#{movie.id}"
    visit movie_url(movie)

    expect(page).to have_text(movie.title.upcase)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.released_on)
    expect(page).to have_text(movie.description[0,9])
    expect(page).to have_text('$600,000,000.00')

end

=begin
it "show the total_gross if total_gross more than 500000000.00" do

movie = Movie.create(movie_attributes(total_gross: 600000000.00))
visit movie_path(movie)
expect(page).to have_text('$600,000,000.00')
end
it "show flop if total_gross less than 500000000.00" do
  movie = Movie.create(movie_attributes(total_gross: 40000000.00))
  visit movie_path(movie)
  expect(page).to have_text('Flop!')
end
=end


end