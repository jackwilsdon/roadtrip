class UserController < ApplicationController
  def login
    @no_pad = true
    @hide_nav = true
  end

  def login_attempt
    auth_user = User.authenticate(params[:login_attempt]["name"], params[:login_attempt]["password"])
    if auth_user
      flash[:notice] = "Welcome back, " + auth_user.name
      session[:uid] = auth_user.id
      redirect_to "/"
    else
      flash[:notice] = "Invalid username or password!"
      flash[:class] = "alert-error"
      redirect_to :action => "login"
    end 
  end

  def logout
    session[:uid] = nil
    flash[:notice] = "Logged out!"
    redirect_to "/"
  end
end
