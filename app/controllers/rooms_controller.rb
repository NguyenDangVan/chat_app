class RoomsController < ApplicationController
  def show
    # @messages = Message.all
    @room = Room.includes(:messages).find_by id: params[:id]
    @message = Message.new
  end

  def create
    @room = current_user.rooms.build room_params
    if @room.save
      flash[:success] = "Room added"
      redirect_to rooms_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit :sender_id
  end
end
