class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "rooms_#{params['room_id']}channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message data
    current_user.messages.create! content: data['message'], room_id: data['room_id'], conversation_id: 1, group_id: 1
  end
end
