class AddSomecolToSeats < ActiveRecord::Migration
  def change
  	remove_column :seats, :show_id
  	add_column :seats, :auditorium_id, :integer
  	add_index :seats, :auditorium_id
  end
end
