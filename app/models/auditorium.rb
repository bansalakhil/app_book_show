class Auditorium < ActiveRecord::Base
  belongs_to :theatre
  has_many :shows, :dependent => :destroy
  has_many :seats, :dependent => :destroy
  has_one :city, :through => :theatre
  attr_accessible :name
  validates :name, :presence => true
  after_create :allocate_seats

  def info
  	theatre.info + ": #{name}"
  end

  def allocate_seats
  	["silver", "gold", "platinum"].each do |category|
  		(1..10).each do |seat_number|
        seats.create(:seat_no => seat_number, :category => category)
      end
  	end
  end
end
