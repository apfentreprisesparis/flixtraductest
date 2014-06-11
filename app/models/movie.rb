class Movie < ActiveRecord::Base

  def flop?
    #total_gross < 500000000
    total_gross.blank? || total_gross < 50000000
  end
  def self.released
    where('released_on<=?', Time.now).order(released_on: :desc)

  end

  def self.hit_movies
    where('total_gross>=?',500000000).order(total_gross: :desc)
  end

  def self.flop_movies
    where('total_gross<?',40000000).order(total_gross: :asc)
  end

  def self.recently_added
  Movie.order(created_at: :desc).limit(3)
  end

  def self.nothing
    where(total_gross: nil)
  end

  def self.tous
  Movie.all
 #   where(total_gross: nil)
  end



end