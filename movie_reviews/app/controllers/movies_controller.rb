class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @movie.categories.build
  end

  def create
    movie = Movie.create(movie_params)
    if movie.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_year, category_ids: [], categories_attributes: [:name])
  end

end
