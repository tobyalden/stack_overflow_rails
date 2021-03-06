class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    authorize @users
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Sign up success!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def update
    if params[:update_info] == "make_admin"
      authorize user = User.find(params[:id])
      user.update(:admin? => true)
      flash[:notice] = "#{user.email} was given admin status."
      redirect_to users_path
    end
  end

  def destroy
      authorize user = User.find(params[:id])
      user.destroy
      flash[:notice] = "#{user.email} has been deleted."
      redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
