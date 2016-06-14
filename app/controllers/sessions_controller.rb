class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      flash[:notice] = "Signed in as #{user.username}"
      session[:user_id] = user.id
      redirect_to members_path
    else
      flash[:alert] = "Username and password incorrect"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully signed out"
    redirect_to root_path
  end
end
