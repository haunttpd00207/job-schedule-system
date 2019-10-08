# frozen_string_literal: true

module AutoFillText
  class UsersController < ApplicationController

    def index
      @users = User.where("username like '%#{params[:term]}%'").collect(&:username)
      render json: @users.uniq.sort
    end
  end
end
