class Show < ActiveRecord::Base
  attr_accessible :on_date, :start_time, :end_time, :movie_id
  validate :no_conflict
  before_validation :ensure_start_time_less_than_end_time
  belongs_to :movie
  belongs_to :auditorium
  has_many :bookings
  before_destroy :ensure_seats_not_booked
  has_one :theatre, :through => :auditorium
  has_one :city, :through => :theatre

  def can_be_booked?
    Time.now < Time.mktime(on_date.year, on_date.month, on_date.day, start_time.hour, start_time.min, start_time.sec)
  end

  def ensure_start_time_less_than_end_time
    unless (on_date && start_time && end_time && movie_id && start_time < end_time)
      errors[:base] << "Date, time must be in correct format. Start time must be less than end time."
      false
    end
  end

  def no_conflict  
    conflicting_shows = auditorium.shows.where("on_date = :date AND ((start_time <= :start AND end_time >= :start) OR (start_time >= :start AND start_time <= :end))", :date => on_date, :start => start_time, :end => end_time)
    (conflicting_shows = conflicting_shows.where("id != ?", id)) unless new_record?
    return unless conflicting_shows.exists?
    errors[:base] << "Date and time conflicts with other shows."
  end
  
  def info
    auditorium.info + ": #{movie.name}"
  end

  def date_and_time
    "#{on_date}    #{start_time.strftime("%I:%M%p")} - #{end_time.strftime("%I:%M%p")}"
  end

  def ensure_seats_not_booked
    if (can_be_booked? && seats.where(:booked => true).exists?)
      errors[:base] << "Some seats booked."
      return false
    else
      return true
    end    
  end

  def destroy
    raise unless super
  end

end
