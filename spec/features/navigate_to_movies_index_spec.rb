require 'spec_helper'
describe 'navigation entre les films' do

it "Lien vers movies/index" do
  movie = Movie.create(movie_attributes(total_gross: 40000000.00))

  #visit "http://example.com/movies/#{movie.id}"
    visit movie_path(movie)

  expect(page).to have_text(movie.title.upcase)
  expect(page).to have_text(movie.rating)
  expect(page).to have_text("$40,000,000.00")
  expect(page).to have_text(movie.description)
  expect(page).to have_text(movie.released_on)

  click_link "All Movies"
  expect(current_path).to eq(movies_path)
end

  end