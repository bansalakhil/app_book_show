class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.references :movie
      t.date :on_date
      t.time :start_time
      t.time :end_time
      t.timestamps
    end
  end
end
