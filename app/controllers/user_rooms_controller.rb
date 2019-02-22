class UserRoomsController < ApplicationController
  #before_action :load_user_room

  def destroy
    @user_room = UserRoom.find_by user_id: params[:user_id], room_id: params[:room_id]
    @room = Room.find_by id: params[:room_id]
    @users_room = @room.users
    if @user_room.destroy
      format_js
    else
      flash[:danger] = "Delete user failed"
      redirect_to user_rooms_path
    end
  end

  private

  def format_js
    respond_to do |format|
      format.js
    end
  end

  def load_user_room
    @room = Room.find_by id: params[:room_id]
    @user_rooms = @room.users
    byebug
  end
end
