class Searches::RoomMembersController < ApplicationController


  def show
    room = Room.find params[:id]
    @users = room.users.ransack(name_cont: params[:search]).result
  end

  def index
    @users = User.ransack(name_cont: params[:search]).result
  end
end
