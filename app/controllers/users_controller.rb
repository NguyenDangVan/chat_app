class UsersController < ApplicationController
  before_action :load_user
  # before_action :correct_user, only: [:update, :edit]

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
    params.require(:user).permit :name, :email, :birthday, :address, :password
  end
end
