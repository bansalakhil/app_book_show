class UserMailer < ActionMailer::Base
  default from: "seatbooked@gmail.com"
  def order_receipt(order)
  	@price, @seat_info, @show, @user, @transaction_id = order.values
  	mail(:to => order[:user].email_id, :subject => "Seats Successfully Booked")
  end
end
