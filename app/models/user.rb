class User < ActiveRecord::Base
  attr_accessible :access_to, :name, :password, :updated_at
  validates :name, :presence => true, :uniqueness => true

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
    val = false 
    if access_to
      val = access_to.split(",").include? trip_id.to_s
    else
      val = false
    end
   
    if id == Trip.find(trip_id).user.id
      val = true
    end

    val
  end

end
