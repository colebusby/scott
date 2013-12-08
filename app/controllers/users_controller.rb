class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your account was successfully created!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_param
    params.require(:user).permit!
  end
end