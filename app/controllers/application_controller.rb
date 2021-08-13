class ApplicationController < ActionController::Base
  include RailsWarden::Authentication
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    if !current_user
      flash[:error] = "You need to sign in to view this page."
      redirect_to '/signin'
    end
  end

  def authorize_admin
    if !(current_user && current_user.admin)
      flash[:error] = "Admins only. Please sign in as an admin."
      redirect_to '/signin'
    end
  end
end
