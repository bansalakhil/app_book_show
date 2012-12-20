class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.references :show
      t.integer :seat_no
      t.string :category
      t.timestamps
    end
  end
end
