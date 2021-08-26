# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_room, only: %i[new create]

  def new
    @message = @room.messages.new
  end

  def create
    @message = @room.messages.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to @room }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
