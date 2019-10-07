# frozen_string_literal: true

class SuggestsController < ApplicationController
  def create
    @suggest = current_user.suggests.build suggest_params
    @suggest.save
    respond_to do |format|
      format.js
    end
  end

  private

  def suggest_params
    params.require(:suggest).permit :content
  end
end
