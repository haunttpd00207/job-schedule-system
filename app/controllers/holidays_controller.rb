# frozen_string_literal: true

class HolidaysController < ApplicationController
  def index
    @holidays = Holiday.all
  end
end
