class AddColToSeats < ActiveRecord::Migration
  def change
  end
  add_index :seats, :show_id
end
