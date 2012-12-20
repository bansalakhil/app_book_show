class AddTimeToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :from_date, :date
    add_column :movies, :start_time, :time
    add_column :movies, :end_time, :time
    add_column :movies, :silver, :decimal
    add_column :movies, :gold, :decimal
    add_column :movies, :platinum, :decimal
  end
end
