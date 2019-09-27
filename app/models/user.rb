# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tasks
  has_many :recurring_tasks
  has_many :reports

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages

  enum role: { user: 0, leader: 1, admin: 2 }

  after_update_commit { AppearanceBroadcastJob.perform_later self }
end
