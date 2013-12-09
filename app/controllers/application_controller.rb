class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :signed_in?, :current_cart, :cart_made?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def require_user
    unless signed_in?
      flash[:error] = "You must be signed in to access that page."
      redirect_to root_path
    end
  end

  def current_cart
    @current_cart ||= Cart.find(session[:cart_id]) if session[:cart_id]
  end

  def cart_made?
    !!current_cart
  end
end
