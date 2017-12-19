class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    if user
      organization = user.organization
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to organization
      else
        flash[:alert] = 'Username or password is invalid'
        render :new
      end
    else
      flash[:alert] = 'Log in failed. Please try again.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully logged out.'
    redirect_to new_session_path
  end

  def index
    redirect_to new_session_path
  end
end
