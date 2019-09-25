# frozen_string_literal: true

class RecurringTasksController < ApplicationController
  before_action :load_recurring_task, only: %i(show edit update destroy)

  def index
    @recurring_tasks = current_user.recurring_tasks.all
  end

  def show; end

  def new
    @recurring_task = RecurringTask.new
  end

  def edit; end

  def create
    @recurring_task = current_user.recurring_tasks.build recurring_task_params
    if @recurring_task.save
      redirect_to root_path, success: t(".create_recuring_task")
    else
      respond_to do |format|
        format.js {}
      end
    end
  end

  def update
    if params[:task]
      if @recurring_task.update(anchor: params[:task][:start])
        redirect_to root_path, success: t(".update_anchor_task")
      else
        respond_to do |format|
          format.js {}
        end
      end
    else
      if @recurring_task.update recurring_task_params
        redirect_to root_path, success: t(".update_recuring_task")
      else
        respond_to do |format|
          format.js {}
        end
      end
    end
  end

  def destroy
    if @recurring_task.destroy
      redirect_to root_path, danger: t(".destroy_recuring_task")
    else
      respond_to do |format|
        format.js {}
      end
    end
  end

  private

  def recurring_task_params
    params.require(:recurring_task).permit :title, :anchor, :frequency, :color
  end

  def load_recurring_task
    @recurring_task = RecurringTask.find_by id: params[:id]
  end
end
