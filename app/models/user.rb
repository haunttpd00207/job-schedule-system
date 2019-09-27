# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tasks
  has_many :recurring_tasks
  has_many :reports

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable
end
