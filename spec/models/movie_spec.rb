require 'spec_helper'
describe "Un film" do

  it "is a flop if the total gross is less than $50M" do
    movie = Movie.new(total_gross: 40000000.00)
    expect(movie.flop?).to be_true
  end


  it "is not a flop if the total gross is more than $50M" do
    movie = Movie.new(total_gross: 600000000.00)
    expect(movie.flop?).to be_false
  end

  it "est sorti(le film) quand la date de sortie est dans le passé" do
    movie = Movie.create(movie_attributes(released_on: 3.months.ago))

    expect(Movie.released).to include(movie)
  end

  it "n'est pas sorti(le film) quand la date de sortie est dans le futur" do
    movie = Movie.create(movie_attributes(released_on: 3.months.from_now))

    expect(Movie.released).not_to include(movie)
  end

  it "retoure les films sortis ordonnés du plus récent au plus ancien" do
    movie1 = Movie.create(movie_attributes(released_on: 3.months.ago))
    movie2 = Movie.create(movie_attributes(released_on: 2.months.ago))
    movie3 = Movie.create(movie_attributes(released_on: 1.months.ago))

    expect(Movie.released).to eq([movie3, movie2, movie1])
  end
end