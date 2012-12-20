class CreateTheatres < ActiveRecord::Migration
  def change
    create_table :theatres do |t|
      t.string :name
      t.references :city

      t.timestamps
    end
    add_index :theatres, :city_id
  end
end
