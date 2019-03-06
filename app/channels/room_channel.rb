class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak data
    if data['group_id'].present?
      user_room = UserRoom.find_by user_id: data['sender_id'], room_id: data['group_id']
      MessageRoom.create content: data['message'], user_room_id: user_room.id
    else
      Message.create! content: data['message'], user_id: data['sender_id'], recipient_id: data['recipient_id']
    end
  end
end
