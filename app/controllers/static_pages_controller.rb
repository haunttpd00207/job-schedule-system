# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @working = current_user.workings.last
  end
end
