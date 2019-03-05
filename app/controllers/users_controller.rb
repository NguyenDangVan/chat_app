class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update)
  # before_action :correct_user, only: [:update, :edit]

  def show
    respond_to do |format|
      format.js
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = "Welcome to IChat!"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Updated user"
    else
      flash[:danger] = "Update failed"
    end
    redirect_to root_path
  end

  private
  def load_user
    return if @user = User.find_by(id: params[:id])
    flash[:danger] = "Not found user"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :name, :email, :avatar, :address, :password, :password_confirmation
  end
end
