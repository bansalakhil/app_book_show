class AddColToShows < ActiveRecord::Migration
  def change
  end
  add_index :shows, :movie_id
end
