# frozen_string_literal: true

module ApplicationHelper
  def online_status(user)
    content_tag :span, user.username, class: "user-#{user.id} online_status #{'online' if user.online?}"
  end

  def present_authorization?(chatroom)
    chatroom.users.ids.include?(current_user.id)
  end

  def admin_or_leader?
    !current_user.user?
  end

  def strftimes(message)
    message.created_at.strftime("%I:%M %p")
  end

  def count_user_chatrooms(chatroom)
    ChatroomUser.where(chatroom_id: chatroom.id).count
  end
end
