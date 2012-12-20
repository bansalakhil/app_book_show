class AddSeatsToMovies < ActiveRecord::Migration
  def up
  	remove_column :movies, :"silver_{i + 1}"
  	remove_column :movies, :"gold_{i + 1}"
  	remove_column :movies, :"platinum_{i + 1}"
  	10.times do |i|
      add_column :movies, :"silver_#{i + 1}", :boolean, :default => false
      add_column :movies, :"gold_#{i + 1}", :boolean, :default => false
      add_column :movies, :"platinum_#{i + 1}", :boolean, :default => false
  	end
  end
  def down
  end
end
