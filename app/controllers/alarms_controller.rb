class AlarmsController < ApplicationController

  def new
    @alarm = Alarm.new
  end

  def test
    puts params
    player = current_user.spotify.player
    player.play_track(params[:id_device], params[:uri_track])
    redirect_to home_path
  end
end