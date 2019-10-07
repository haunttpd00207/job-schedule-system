# frozen_string_literal: true

class DirectMessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @mess = Message.new
    @chatroom = Chatroom.find params[:id]
    @messages = @chatroom.messages.includes(:user).order(created_at: :asc).limit(Settings.limit.messages)
    @chatroom_user = current_user.chatroom_users.find_by(chatroom_id: @chatroom.id)
    render "chatrooms/show"
  end

  def create
    users = [current_user, User.find(params[:user_id])]
    username = users.map(&:username).sort
    name = "Conversation:#{username.join(':')}"
    chatroom = Chatroom.find_or_create_by(name: name, direct_message: true) do |chatroom|
      chatroom.users = users
    end
    redirect_to direct_message_path(chatroom)
  end
end
