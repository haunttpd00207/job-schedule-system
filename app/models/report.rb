# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :task
  belongs_to :user

  scope :undon_report, -> (task_ids){where task_id: task_ids}
end
