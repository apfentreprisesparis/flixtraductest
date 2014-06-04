class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    # fail
    # Etape 1 : On rapelle les paramètres
    @movie = Movie.find(params[:id])
    # Etape 2 : On autorise les champs sur lesquels on peut transmettre des données à la base de données.
    #movie_params = params[:movie].permit(:title, :description, :rating, :released_on, :total_gross)
    movie_params = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross)

    # Etape 3 : On fait l'update  en fonction de la variable movie_params
    @movie.update(movie_params)
    # Etape 4 : On redirige sur la variable @movie
    redirect_to @movie
    #redirect_to action: "show", id: (params[:id])
    #redirect_to action: "show"
  end

  def new
  @movie = Movie.new
  end

  def create
    movie_params = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross)

    # Etape 3 : On fait l'update  en fonction de la variable movie_params
    @movie= Movie.new(movie_params)
    @movie.save
    # Etape 4 : On redirige sur la variable @movie
    redirect_to @movie
    #redirect_to action: "show", id: (params[:id])
    #redirect_to action: "show"

  end


end