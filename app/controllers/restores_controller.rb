# frozen_string_literal: true

class RestoresController < ApplicationController
  def update
    ActiveRecord::Base.transaction do
      Task.restore(params[:task_id])
      @task = Task.find params[:task_id]
      @task.open! if @task.done?
      Report.undon_report(@task.id).each(&:destroy)
    end
  rescue ActiveRecord::RecordInvalid
    redirect_to root_path, warning: t("can_not_done")
  end
end
