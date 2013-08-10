class TripController < ApplicationController
  def list
    auth
    @trips = @user.trips
  end 

  def show
    auth
    unless Trip.where(:id => params[:id]).blank?
      @trip = Trip.find(params[:id])
    else
      @trip = false
    end
  end
end
