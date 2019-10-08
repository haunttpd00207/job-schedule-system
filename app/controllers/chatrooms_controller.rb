# frozen_string_literal: true

class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[show edit update destroy]
  before_action :load_chatrooms

  def show
    @mess = Message.new
    @users = @chatroom.users.where.not(id: current_user.id)
    @messages = @chatroom.messages.includes(:user).order(created_at: :asc).limit(Settings.limit.messages)
    @chatroom_user = current_user.chatroom_users.find_by(chatroom_id: @chatroom.id)
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    respond_to do |format|
      if @chatroom.save
        format.html { redirect_to chatrooms_path }
      else
        format.html { render :new }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chatroom.update(chatroom_params)
        format.html { redirect_to chatrooms_path }
      else
        format.html { render :edit }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chatroom.destroy
    respond_to do |format|
      format.html { redirect_to chatrooms_path }
      format.json { head :no_content }
    end
  end

  def search_chatroom
    if params[:search].blank?
      redirect_to chatrooms_path, info: "Please typing any thing on search bar"
    else
      @result = Chatroom.public_channels.search(params[:search])
      @chatrooms = Kaminari.paginate_array(@result).page(params[:page]).per(10)
      render "chatrooms/index"
    end
  end

  def autofilltext
    @chatroom = Chatroom.public_channels.where("name like '%#{params[:term]}%'").collect(&:name)
    render json: @chatroom.uniq.sort
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end

  def load_chatrooms
    @chatrooms = Chatroom.includes(:users).public_channels.page(params[:page]).per(10)
  end
end
