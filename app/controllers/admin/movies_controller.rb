class Admin::MoviesController < ApplicationController
  # GET /movies
  # GET /movies.json
  before_filter :authorize_admin
  before_filter :find_movie, :except => [:index, :new, :create]

  def index
    @movies = Movie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies }
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to [:admin, @movie], notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to [:admin, @movie], notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    begin
      @movie.destroy
    rescue
      flash[:notice] = "Movie could not be destroyed."
    else
      flash[:notice] = "Movie successfully destroyed."
    end

    respond_to do |format|
      format.html { redirect_to admin_movies_url }
      format.json { head :no_content }
    end
  end

  def find_movie
    begin
      @movie = Movie.find(params[:id])
    rescue
      redirect_to admin_movies_url, :notice => "Movie not found."
    end
  end
end
