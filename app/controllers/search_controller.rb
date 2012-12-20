class SearchController < ApplicationController
  def index
  	@cities = City.order(:name)
    @movies = Movie.order(:name)
    @dates = Show.select(:on_date).uniq.where("on_date >= ?", Date.today)
  end

  def create
    begin
      raise unless ((Date.parse(@date = params[:search][:date]) >= Date.today) && (@shows = Show.joins(:city).where("cities.id = :city_id AND shows.on_date = :date AND shows.movie_id = :movie_id", params[:search])).exists?)
      @movie = Movie.find(params[:search][:movie_id])
    rescue
      redirect_to search_url, :notice => 'No Shows found.'
    end
  end
end
