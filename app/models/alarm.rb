class Alarm < ApplicationRecord
  belongs_to :user
  before_create :adjust_time
  validates :time, presence: true
  validates :track, presence: true
  validates :device, presence: true

  def ring!
    user = User.find(self.user_id)
    player = user.spotify.player
    player.play_track(self.device, self.track)
  end

  def adjust_time
    self.time -= Time.zone_offset(Time.now.zone)
  end

  def schedule
    if Time.now > self.time
      self.time += 1.day
    end
    AlarmJob.set(wait_until: self.time).perform_later(self)
  end

  def reschedule
    if self.repeat_daily
      self.schedule
    end
  end
end