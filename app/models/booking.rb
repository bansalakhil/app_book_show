class Booking < ActiveRecord::Base
  attr_accessible :show_id, :seat_id, :user_id
  belongs_to :show
  belongs_to :user
  belongs_to :seat

  def self.book_some_seats(seat_ids, show, user)
    admin, booking = User.where(:is_admin => true).first, {}
    begin
  	  Booking.transaction do
        booking = seat_ids.inject({:price => 0, :seat_info => ""}) do |booking_info, id|
          raise if (seat = show.auditorium.seats.find(id)).booked_for?(show)
          create!(:show_id => show.id, :seat_id => id, :user_id => user.id)
          user.withdraw(amount = seat.price_for(show))
          admin.deposit(amount)
          booking_info.merge(:price => amount, :seat_info => seat.info) { |key, v1, v2| v1 + v2 }
        end
      end
    rescue
      false
    else
      transaction_id = Transaction.log(:debited_from => user.id, :credited_to => admin.id, :amount => booking[:price], :purpose => "Booked seats #{show.info}  #{show.date_and_time}  #{booking[:seat_info]}")
      order = {:price => booking[:price], :seat_info => booking[:seat_info], :show => show, :user => user, :transaction_id => transaction_id }
      UserMailer.order_receipt(order).deliver
      true
    end
  end

end
