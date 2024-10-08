class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_#{current_user.id}_channel"
  end

  def unsubscribed
    # Cleanup when channel is unsubscribed
  end
end
