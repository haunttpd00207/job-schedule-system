class CreateRecurringTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :recurring_tasks do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.date :anchor
      t.integer :frequency, limit: 1, default: 0
      t.string :color

      t.timestamps
    end
  end
end
