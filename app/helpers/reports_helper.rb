# frozen_string_literal: true

module ReportsHelper
  URI = ENV['uri_slack']

  def call_api_slack(reports, channel)
    report = reports.includes(:task).map { |r| r.task.title }.join("\n")
    send_slack_notification(["```#{report}```"].join, channel)
  end

  private

  def send_slack_notification(message, channel)
    return if message.blank?

    eac = ExternalApiCaller.new
    eac.call URI,
             username: current_user.username.to_s,
             text: message,
             channel: channel.to_s,
             icon_url: current_user.image.to_s
  end
end
