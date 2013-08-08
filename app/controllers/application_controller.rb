class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :before

  def before
    unless User.where(:id => session[:uid]).blank?
      @user = User.find(session[:uid])
    else
      @user = false
    end
  end
end
