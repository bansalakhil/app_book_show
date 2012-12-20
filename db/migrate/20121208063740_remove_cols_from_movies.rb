class RemoveColsFromMovies < ActiveRecord::Migration
  def change
  	remove_column :movies, :last_booking_date, :silver, :gold, :platinum, :start_time, :end_time
  end
end
