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



end