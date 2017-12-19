class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :get_organization, only: [:new, :create, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
  end

  # This serves as the registration method
  def create
    @user = User.new(user_params)
    @user.organization = @organization
    if @user.save
      redirect_to new_session_path, notice: 'User account created!'
    else
      render 'new'
    end
  end

  def update
    if @user == current_user
      @user.update!(user_params)
      if @user.save
        redirect_to @organization, status: :accepted
      else
        render 'edit'
      end
    else
      render 'edit', {error: "You are not authorized to update this user"}, status: :unauthorized
    end
  end

  def destroy
    if @user == current_user
      @user.destroy
      flash[:notice] = 'User account deleted from Organization.'
      redirect_to @organization
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def get_organization
    @organization = Organization.find(params[:organization_id])
  end

  def set_user
    @user = User.find(params[:id])
  end

end
