# frozen_string_literal: true

class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    status_user
  end

  def unsubscribed
    status_user
  end

  private

  def status_user
    current_user.toggle!(:online)
    stream_from("appearances_channel") if current_user.online
    ActionCable.server.broadcast "appearances_channel",
                                   user_id: current_user.id,
                                   online: current_user.online
  end
end
