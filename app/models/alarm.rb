class Alarm < ApplicationRecord
  belongs_to :user
  validates :time, presence: true
  validates :track, presence: true
  validates :device, presence: true
end
