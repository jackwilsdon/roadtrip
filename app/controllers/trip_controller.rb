class TripController < ApplicationController
  def index
    auth
    redirect_to :action => "list"
  end

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
    auth
  	unless Trip.where(:id => params[:id]).blank?
	  	@points = Trip.find(params[:id]).waypoints
  	else
  		@points = false
  	end
  	if @points
	  	render json: @points
        return
	end
    render json: {:error => true}
  end

  def new
    auth
  end

  def new_submit
    auth

    if params[:new_submit][:name].empty?
      flash[:notice] = "You need to provide a name!"
      flash[:class] = "alert-error"
      redirect_to :action => "new"
    end

    @trip = Trip.new(:name => params[:new_submit][:name], :user_id => @user.id)

    unless @trip.valid?
      flash[:notice] = "Validation error!"
      flash[:class] = "alert-error"
      redirect_to :action => "new"
    end

	@trip.save

    flash[:notice] = "Created trip #{@trip.name}"
    flash[:class] = "alert-success"
    redirect_to :action => "edit"
  end

  def edit
    auth
    if Trip.where(:id => params[:id]).blank?
      @trip = Trip.find(params[:id])
    else
      @trip = false
    end
  end

  def destroy
    auth
    unless Trip.where(:id => params[:id]).blank?
      trip = Trip.find(params[:id])
      trip.destroy
      flash[:notice] = "Deleted trip " + trip.name
      flash[:class] = "alert-success"
    else
      flash[:notice] = "Unable to delete trip #{params[:id]}!"
      flash[:class] = "alert-error"
    end
    redirect_to :controller => "trip", :action => "list"
  end
end