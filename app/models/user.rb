# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tasks
  has_many :recurring_tasks
  has_many :reports
  has_many :workings

  enum permission: { close: 0, open: 1 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages

  enum role: { user: 0, leader: 1, admin: 2 }
end
