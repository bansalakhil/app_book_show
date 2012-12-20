class RemoveSeatsFromMovies < ActiveRecord::Migration
  def change
  	drop_table :movies
    create_table :movies do |t|
      t.string :name
      t.date :last_booking_date
      t.time :start_time
      t.time :end_time
      t.references :auditorium
    end
  end
end
