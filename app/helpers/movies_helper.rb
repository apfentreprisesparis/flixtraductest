module MoviesHelper

 def format_total_gross(movie)
    if movie.flop?
      content_tag(:strong,'Flop! '"#{number_to_currency(movie.total_gross)}" )
    else
      content_tag(:strong,'Hit! '"#{number_to_currency(movie.total_gross)}" )
    end
 end

  def image_for(movie)
    if movie.image_file_name.blank?
      image_tag('placeholder.png')
     elsif movie.image_file_name.present?  &&
        File.exist?(movie.image_file_name) == false
    "poster"
      else
      image_tag(movie.image_file_name)
    end
  end

  def movietous
    if action_name == 'index'
      pluralize(@movies.count, 'Movie') + " dont la date de sortie est inférieure à aujourdhui, ordonné du plus récent au plus ancien..."
     else
       pluralize(@movies.count, 'Movie') +"Tout les films"
    end
  end


end


