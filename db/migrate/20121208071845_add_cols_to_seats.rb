class AddColsToSeats < ActiveRecord::Migration
  def change
  	change_table :seats do |t|
  	  t.boolean :booked, :default => false
  	end
  end
end
