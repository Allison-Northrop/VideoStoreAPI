class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render :json => movies, each_serializer: MoviePreviewSerializer
  end

  def show
    movie = Movie.find_by(title: params[:title].capitalize)
    render :json => movie
  end
end
