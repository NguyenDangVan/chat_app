class RoomsController < ApplicationController
  def new
    @room = Room.new

    respond_to do |format|
      format.js
    end
  end

  def show; end

  def create
    @room = current_user.rooms.create room_params
    # if @room_user_room.save
    #   flash[:success] = "Room added"
    # else
    #   render :new
    # end

    respond_to do |format|
      format.js
    end
  end

  def index
    @rooms = Room.all
  end

  private

  def room_params
    params.require(:room).permit :name, :description, :owner_id
  end
end
