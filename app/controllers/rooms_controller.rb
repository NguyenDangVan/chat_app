class RoomsController < ApplicationController
  before_action :logged_in_user

  def new
    @room = Room.new

    respond_to do |format|
      format.js
    end
  end

  def show
    @room = Room.find_by id: params[:id]

    @messages = @room.message_rooms
    @message = MessageRoom.new
  end

  def create
    @room = current_user.rooms.create room_params
    @room.owner_id = current_user.id

    respond_to do |format|
      format.js
    end
  end

  def edit
    @room = Room.find_by id: params[:id]
    @users_room = @room.users

    respond_to do |format|
      format.js
    end
  end

  def update
    @room = Room.find_by id: params[:id]
    if @room.update_attributes room_params
      @message = MessageRoom.new
      flash.now[:success] = "Updated successfully"
    else
      flash[:danger] = "Updated failed"
      redirect_to user_rooms_path
    end
    @messages = @room.message_rooms

    respond_to do |format|
      format.js
    end
  end

  def index
    @rooms = Room.all
  end

  private

  def room_params
    params.require(:room).permit :name, :description
  end
end
