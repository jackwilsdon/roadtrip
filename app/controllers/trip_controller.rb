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

  def show_json
  	unless Trip.where(:id => params[:id]).blank?
	  	@points = Trip.find(params[:id]).waypoints
  	else
  		@points = false
  	end
  	if @points
	  	render :json, @points
	end
  end

  def new
  end

  def new_submit
    if params[:new_submit][:name].empty?
      flash[:notice] = "You need to provide a name!"
      flash[:class] = "alert-error"
      redirect_to :action => "new"
    end
  end
end
