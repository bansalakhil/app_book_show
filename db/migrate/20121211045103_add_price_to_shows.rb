class AddPriceToShows < ActiveRecord::Migration
  def change
  	add_column :shows, :silver, :integer, :default => 120
  	add_column :shows, :gold, :integer, :default => 150
  	add_column :shows, :platinum, :integer, :default => 200
  end
end
