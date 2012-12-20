class AddMorecolToSeats < ActiveRecord::Migration
  def change
  	remove_column :seats, :booked
  end
end
