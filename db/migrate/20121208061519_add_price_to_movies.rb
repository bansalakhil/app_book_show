class AddPriceToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :gold, :decimal
    add_column :movies, :silver, :decimal
    add_column :movies, :platinum, :decimal
  end
end
