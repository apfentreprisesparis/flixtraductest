class Movie < ActiveRecord::Base

  def flop?
    #total_gross < 500000000
    total_gross.blank? || total_gross < 500000000
  end


end
