# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @rows = current_user.reports.includes(:task, :user)
    @reports = Kaminari.paginate_array(@rows).page(params[:page]).per(5)
  end

  def create
    @user = User.find params[:user_id]
    SendEmailJob.delay(run_at: 20.seconds.from_now).perform_later(@user)
    redirect_to reports_path
  end
end
