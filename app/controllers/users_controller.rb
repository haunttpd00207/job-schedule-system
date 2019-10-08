# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).page(params[:page]).per(10)
  end

  def search_user
    @chatroom = Chatroom.find_by_id(params[:chatroom_id])
    if params[:search_user].present?
      @users = Kaminari.paginate_array(User.where.not(id: current_user.id).search_user(params[:search_user])).page(params[:page]).per(10)
      render "users/index"
    else
      redirect_to request.referer, info: "Please typing any thing on search bar"
    end
  end

  def autofilltext
    @users = User.where("username like '%#{params[:term]}%'").collect(&:username)
    render json: @users.uniq.sort
  end
end
