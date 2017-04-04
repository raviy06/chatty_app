class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	Message.create!(body: data['message'], room_id: data['room_id'], user_id: 3)
  end
end
