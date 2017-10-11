class SessionsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.find_by(username: params[:username])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to '/'
    else
      flash.now.alert = 'Username or password is invalid'
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to '/login'
  end

end