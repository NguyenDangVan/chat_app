class UsersController < ApplicationController
  before_action :load_user, except: %i(new create)
  # before_action :correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    byebug
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:succes] = "Updated"
    else
      render :edit
    end
    redirect_to root_path
  end


  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = "Not found user"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :name, :email, :birthday, :address, :password, :password_confirmation
  end
end
