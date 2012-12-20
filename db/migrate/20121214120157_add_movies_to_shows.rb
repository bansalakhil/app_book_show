class AddMoviesToShows < ActiveRecord::Migration
  def change
  	add_column :shows, :movie_id, :integer
  	add_index :shows, :movie_id
  end
end
