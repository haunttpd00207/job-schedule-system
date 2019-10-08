# frozen_string_literal: true

class AddUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user_chatroom

  def create
    return redirect_to request.referer, info: "Please typing any thing on search bar" unless @user

    if check_user_in?(@user)
      redirect_to @chatroom, danger: "#{@user.username} was already in #{@chatroom.name}"
    else
      @chatroom_user = ChatroomUser.find_or_create_by(user_id: @user.id, chatroom_id: @chatroom.id)
      redirect_to @chatroom, info: "You added successful #{@user.username} in #{@chatroom.name}"
    end
  end

  private

  def check_user_in?(user)
    @chatroom.users.ids.include?(user.id)
  end

  def load_user_chatroom
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @chatroom = Chatroom.includes(:users).find(params[:chatroom_id])
    end
  end
end
