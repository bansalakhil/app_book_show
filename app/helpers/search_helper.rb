module SearchHelper
	def group_by_auditorium(shows)
    shows.inject(Hash.new {|h, key| h[key] = [] }) { |group, show| (group[show.auditorium_id] << show); group }.each_value do |shows|
      shows.sort! { |s1, s2| s1.start_time <=> s2.start_time }
      shows << "#{shows[0].city.name}: #{shows[0].theatre.name}: #{shows[0].auditorium.name}" 
    end
  end
  def link_text(show)
    show.start_time.strftime("%I:%M%p") + " - " + show.end_time.strftime("%I:%M%p")
  end
end
