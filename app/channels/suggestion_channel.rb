class SuggestionChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'suggestion_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
