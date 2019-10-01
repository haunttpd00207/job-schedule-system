class SendEmailJob < ApplicationJob
  queue_as :default

  def perform user
    @user = user
    @report = user.reports
    ReportMailer.report_email(@report, @user).deliver
  end
end
