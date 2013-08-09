class StreamController < ApplicationController
  def index
    unless @user
      redirect_to controller: "user", action: "login"
      return
    end

    @trips = []
    Trip.all.each do |trip|
      if @user.can_access trip.id
        @trips.push trip
      end
    end

    if @trips.length > 1
    	@trips = @trips.sort_by { |a, b| a.updated_at <=> b.updated_at }
  	end
  end
end
