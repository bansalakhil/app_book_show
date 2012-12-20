class Movie < ActiveRecord::Base
  attr_accessible :name
  has_many :shows, :dependent => :destroy
  validates :name, :presence => true
end
