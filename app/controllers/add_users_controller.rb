# frozen_string_literal: true

class AddUsersController < ApplicationController
  before_action :authenticate_user!

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chatroom_user = ChatroomUser.find_or_create_by(user_id: params[:user_id], chatroom_id: @chatroom.id)
    redirect_to @chatroom
  end
end
