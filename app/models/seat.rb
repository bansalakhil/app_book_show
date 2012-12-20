class Seat < ActiveRecord::Base
  attr_accessible :seat_no, :category
  belongs_to :auditorium

  def price_for(show)
    show.send(category)
  end

  def booked_for?(show)
#  	Booking.find_by_seat_id_and_show_id(id, show.id) ? true : false
    Booking.exists?(:seat_id => id, :show_id => show.id)
  end

  def info
  	" #{category}: #{seat_no}"
  end
end
