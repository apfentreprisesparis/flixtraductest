module MoviesHelper

 def format_total_gross(movie)
    if movie.flop?

      content_tag(:strong,'Flop! '"#{number_to_currency(movie.total_gross)}" )
    else
      number_to_currency(movie.total_gross)
    end
  end

end
