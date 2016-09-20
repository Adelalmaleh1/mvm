class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @movies = Movie.all.order(:cached_votes_score => :desc)
    @movies = Movie.search(params[:search])
  end

  def show
    @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")
  end

  def new
    @movie = current_user.movies.build
    @movie = Movie.new 
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end
  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @movie = current_user.movies.build(movie_params)
    @movie.category_id = params[:category_id]
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @movie.category_id = params[:category_id]
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def upvote
    @movie.upvote_from current_user
    redirect_to root_path
  end

  def downvote
    @movie.downvote_from current_user
    redirect_to root_path
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end
    def movie_params
      params.require(:movie).permit(:title, :description, :director, :rating, :image)
    end
end
