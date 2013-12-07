class SessionsController < ApplicationController
  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Email or Password did not match."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You are now logged out."
    redirect_to root_path
  end
end