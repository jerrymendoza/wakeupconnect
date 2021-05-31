class AlarmJob < ApplicationJob
  queue_as :default

  def perform(alarm)
    alarm.ring!
  end
end
