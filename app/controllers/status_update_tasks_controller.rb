# frozen_string_literal: true

class StatusUpdateTasksController < ApplicationController
  def update
    @task = Task.find params[:task_id]
    ActiveRecord::Base.transaction do
      @task.done! if @task.open?
      @task.destroy
      @task.reports.create! task_id: @task, user_id: current_user.id
    end
  rescue ActiveRecord::RecordInvalid
    redirect_to root_path, warning: t("can_not_done")
  end
end
