class Theatre < ActiveRecord::Base
  belongs_to :city
  has_many :auditoria, :dependent => :destroy
  has_many :shows, :through => :auditoria
  attr_accessible :name
  validates :name, :presence => true

  def info
  	city.info + ": #{name }"
  end
end
