class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :show_id
      t.integer :seat_id
      t.integer :user_id
      t.timestamps
    end
    add_index :bookings, [:show_id, :seat_id, :user_id]
  end
end
