class RoomsController < ApplicationController
  before_action :logged_in_user
  before_action :set_room, only: [:show, :edit, :destroy, :update]
  before_action :set_user_room, only: :show


  def new
    @room = Room.new

    respond_to do |format|
      format.js
    end
  end

  def show
    @messages = @room.message_rooms
    @message = MessageRoom.new
  end

  def create
    @room = current_user.rooms.create room_params
    params[:members].each {|a| UserRoom.create user_id: a, room_id: @room.id}
    @room.owner_id = current_user.id
    @messages = @room.message_rooms
    if @room.save
      flash[:success] = "Create group successfully"

    else
      flash[:danger] = "Create group failed"
    end

    redirect_to user_rooms_path
    # respond_to do |format|
    #   format.js
    # end
  end

  def edit
    if params[:user_id]
      @users_room = @room.users
    end

    respond_to do |format|
      format.js
    end
  end

  def update
    if @room.update_attributes room_params
      @message = MessageRoom.new
      flash[:success] = "Updated successfully"
    else
      flash[:danger] = "Updated failed"
      redirect_to user_rooms_path
    end
    @messages = @room.message_rooms

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @room.destroy
    flash[:success] = "Your group deleted."
    redirect_to user_rooms_path(current_user.id)
  end

  def index
    @rooms = Room.where(owner_id: current_user.id)
    @groups_of_user = current_user.rooms
  end

  private

  def room_params
    params.require(:room).permit :name, :description
  end

  def set_room
    @room = Room.find_by id: params[:id]
  end

  def set_user_room
    @user_room = UserRoom.find_by id: current_user.id
  end
end
