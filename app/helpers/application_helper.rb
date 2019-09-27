# frozen_string_literal: true

module ApplicationHelper
  def present_authorization?(chatroom)
    chatroom.users.ids.include?(current_user.id)
  end

  def admin_or_leader?
    current_user.leader? || current_user.admin?
  end

  def strftimes(message)
    message.created_at.strftime("%I:%M %p")
  end
end
