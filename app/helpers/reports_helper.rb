# frozen_string_literal: true

module ReportsHelper
  URI = "https://hooks.slack.com/services/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"

  def call_api_slack(reports)
    report = reports.includes(:task).map { |r| r.task.title }.join("\n")
    send_slack_notification(["```#{report}```"].join)
  end

  private

  def send_slack_notification(message)
    return unless message.present?

    eac = ExternalApiCaller.new
    eac.call URI,
             username: current_user.username.to_s,
             text: message,
             channel: "#slack_to_app",
             icon_url: "http://static.mailchimp.com/web/favicon.png"
  end
end
