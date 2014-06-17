module MoviesHelper

  def format_total_gross(movie)
    if movie.flop?
      content_tag(:strong, 'Flop! ' "#{number_to_currency(movie.total_gross)}")
    else
      content_tag(:strong, 'Hit! ' "#{number_to_currency(movie.total_gross)}")
    end
  end


  def image_for(movie)
    if @routes

      if movie.image_file_name.present? && File.file?("app/assets/images/#{movie.image_file_name}") == true
        image_tag movie.image_file_name, height: '10%', width: '10%'
      elsif movie.image_file_name.blank?
        image_tag('placeholder.png')
      else
        movie.image_file_name.present? && File.file?("app/assets/images/#{movie.image_file_name}") == false
        "Nom Ouii / Fichier Nooon"
      end
    else
      if movie.image_file_name.present? && File.file?("app/assets/images/#{movie.image_file_name}") == true
        image_tag movie.image_file_name, height: '20%', width: '20%'
      elsif movie.image_file_name.blank?
        image_tag('placeholder.png')
      else
        movie.image_file_name.present? && File.file?("app/assets/images/#{movie.image_file_name}") == false
        "Nom Ouii / Fichier Nooon"
      end
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


