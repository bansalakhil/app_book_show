class RemoveMovieFromShows < ActiveRecord::Migration
  def up
  	remove_column :shows, :movie_name
  end

  def down
  end
end
