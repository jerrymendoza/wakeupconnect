class AlarmJob < ApplicationJob
  queue_as :default

  def perform(alarm)
    alarm.ring!
    alarm.reschedule
  end
end
