# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :load_task, only: %i(show edit update destroy)

  def index
    @tasks = current_user.tasks.tasks_of_months(params[:start], params[:end])
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = current_user.tasks.build task_params
    if @task.save
      redirect_to root_path, success: t(".create_task")
    else
      respond_to do |format|
        format.js {}
      end
    end
  end

  def update
    if @task.update task_params
      redirect_to root_path, success: t(".update_task")
    else
      respond_to do |format|
        format.js {}
      end
    end
  end

  def destroy
    if @task.destroy
      redirect_to root_path, danger: t(".destroy_task")
    else
      respond_to do |format|
        format.js {}
      end
    end
  end

  private

  def task_params
    params.require(:task).permit :title, :date_range, :start, :end, :color
  end

  def load_task
    @task = Task.find_by id: params[:id]
  end
end
