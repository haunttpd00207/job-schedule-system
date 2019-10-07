class AddLimitsToRecurringTask < ActiveRecord::Migration[5.2]
  def change
    add_column :recurring_tasks, :limit, :integer
  end
end
