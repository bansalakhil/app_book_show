class AddColToMovies < ActiveRecord::Migration
  def change
  	change_table :movies do |t|
      t.timestamps
    end
    add_index :movies, :auditorium_id
  end
end
