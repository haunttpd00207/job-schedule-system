class ReportMailer < ApplicationMailer
  def report_email report, user
    @user = user
    @reports = report
    mail to: user.email, subject: "Sample Email"
  end
end
