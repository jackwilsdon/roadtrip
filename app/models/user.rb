class User < ActiveRecord::Base
  attr_accessible :access_to, :name, :password
  validates :name, :presence => true

  has_many :trips

  def self.authenticate(login_name="", login_password="")
    unless User.where(:name => login_name).blank?
      user = User.find_by_name(login_name)
    end

    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

  def match_password(login_password="")
    password == login_password
  end

  def can_access(trip_id=0)
    if access_to
      access_to.split(",").include? trip_id.to_s
    else
      false
    end
  end

end
