class TripController < ApplicationController
  def list
    unless @user
      redirect_to :controller => "user", :action => "login"  
    end
    @trips = @user.trips
  end 

  def show
    
  end
end
