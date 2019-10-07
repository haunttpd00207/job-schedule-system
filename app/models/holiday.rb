# frozen_string_literal: true

class Holiday < ApplicationRecord
  attr_accessor :date_range

  def all_day_holiday?
    start == start.midnight && self.end == self.end.midnight
  end
end
