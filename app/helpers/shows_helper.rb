module ShowsHelper
	def categorize(seats)
    seats.select(:category).uniq.map {|s| s.category }.inject([]) do |seats_by_category, category|
      seats_by_category << {:seats => seats.where(:category => category).order(:seat_no), :category => category}
    end
  end
end
