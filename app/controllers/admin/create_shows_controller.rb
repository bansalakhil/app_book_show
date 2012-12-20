class Admin::CreateShowsController < ApplicationController
  
  before_filter :authorize_admin
	
  def index
  end

  def create
    begin
      Show.transaction do
        @auditoriums = Auditorium.find(params[:auditorium_ids])
        @movie = Movie.find(params[:movie_id])
        from = Date.parse(params[:from_date])
        till = Date.parse(params[:till_date])
        (from..till).each do |date|
          params[:timings].each_value do |time_pair|
            @auditoriums.each do |auditorium|
              show = auditorium.shows.create!(:on_date => date, :start_time => time_pair[:start_time], :end_time => time_pair[:end_time], :movie_id => @movie.id)
            end
          end
        end
      end
    rescue
      flash[:notice] = "Shows could not be created."
    else
      flash[:notice] = "Shows successfully created."
    end
    redirect_to root_url
  end

end
