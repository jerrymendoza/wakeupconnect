class Alarm < ApplicationRecord
  belongs_to :user
  validates :time, presence: true
  validates :track, presence: true
  validates :device, presence: true


  def ring
    user = User.find(self.user_id)
    player = user.spotify.player
    player.play_track(self.device, self.track)
  end
end
