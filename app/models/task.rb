# frozen_string_literal: true

class Task < ApplicationRecord
  attr_accessor :date_range

  belongs_to :user

  validates :title, presence: true
  validates :start, presence: true
  validates :end, presence: true

  # scope :tasks_of_month, -> (start_date, end_date) { where(start: start_date..end_date) }

  scope :tasks_of_months, (lambda do |start_date, end_date|
    where start: start_date..end_date
  end)

  def all_day_task?
    start == start.midnight && self.end == self.end.midnight
  end
end
