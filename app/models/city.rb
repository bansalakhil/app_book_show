class City < ActiveRecord::Base
  validates :name, :presence => true
  attr_accessible :name
  has_many :theatres, :dependent => :destroy
  has_many :auditoria, :through => :theatres
  has_many :shows, :through => :auditoria

  def info
  	name
  end
end
