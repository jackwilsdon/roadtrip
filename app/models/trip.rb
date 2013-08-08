class Trip < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true

  belongs_to :user
  has_many :waypoints
end
