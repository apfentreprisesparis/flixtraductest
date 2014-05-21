require 'spec_helper'
describe "Navigate to detail's movie" do

  it "Navigate to the listing" do
    expect(Movie.count).to eq(0)
    movie = Movie.create(movie_attributes)

    #visit "http://example.com/movies/#{movie.id}"
    visit movies_path(movie)

    expect(page).to have_text(movie.title)
    #expect(page).to have_text(movie.rating)
    #expect(page).to have_text("$318,412,101.00")
    #expect(page).to have_text(movie.description)
    #expect(page).to have_text(movie.released_on)

  click_link (movie.title)
  expect(current_path).to eq(movie_path(movie))
  end

end