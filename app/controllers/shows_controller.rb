class ShowsController < ApplicationController
  before_filter :find_show
  before_filter :authorize_user, :only => [:book_seats]

  def seat_layout
    @seats = @show.auditorium.seats
  end

  def book_seats
    if params[:seats] && Booking.book_some_seats(params[:seats].collect { |seat| seat[:id] }, @show, @user)
      redirect_to search_url, :notice => "Seats successfully booked."
    else
      redirect_to seat_layout_show_path(@show), :notice => "Seats could not be booked."
    end    
  end  

  private
    def find_show
      redirect_to search_url, :notice => 'Show not found.' unless ((@show = Show.find_by_id(params[:id])) && (@show.can_be_booked?))
    end
end