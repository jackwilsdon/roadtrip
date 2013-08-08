class Waypoint < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  validates :latitude, :presence => true
  validates :longitude, :presence => true
  validates :name, :presence => true

  belongs_to :trip
end
