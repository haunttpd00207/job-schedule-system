# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @rows = current_user.reports.includes(:task, :user).select { |report| report.created_at.to_date == Date.today }
    @reports = Kaminari.paginate_array(@rows).page(params[:page]).per(5)
  end

  def create
    @reports = current_user.reports.where("created_at >= ?", Time.now.beginning_of_day)
    # SendEmailJob.delay(run_at: 20.seconds.from_now).perform_later(current_user)
    call_api_slack @reports
    redirect_to reports_path
  end
end
