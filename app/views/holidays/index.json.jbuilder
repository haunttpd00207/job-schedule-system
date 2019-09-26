# frozen_string_literal: true

json.array! @holidays do |holiday|
  date_format = holiday.all_day_holiday? ? "%Y-%m-%d" : "%Y-%m-%dT%H:%M:%S"
  json.holiday_id holiday.id
  json.title holiday.title
  json.editable false
  json.rendering "background"
  json.start holiday.start.strftime(date_format)
  json.end holiday.end.strftime(date_format)
  json.color holiday.color unless holiday.color.blank?
  json.allDay true
end
