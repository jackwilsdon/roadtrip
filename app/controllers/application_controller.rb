class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :before
  helper_method :auth

  def before
    unless User.where(:id => session[:uid]).blank?
      @user = User.find(session[:uid])
    else
      @user = false
    end
  end

  def auth
    unless @user
      redirect_to :controller => "user", :action => "login"
    end
  end
end
