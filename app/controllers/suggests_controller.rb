# frozen_string_literal: true

class SuggestsController < ApplicationController
  def create
    @suggest = current_user.suggests.build suggest_params
    if @suggest.save
      ActionCable.server.broadcast "suggestion_channel",
        status: @suggest.status,
        user_id: @suggest.user_id
    end
  end

  private

  def suggest_params
    params.require(:suggest).permit :content
  end
end
