class AlarmsController < ApplicationController
  before_action :set_alarm, only: [:show, :edit, :update, :destroy]
  def index
    @alarms = current_user.alarms
  end

  def new
    @alarm = Alarm.new
  end

  def edit
  end

  def create
    @alarm = Alarm.new(alarm_params.merge(user_id: current_user.id))
    if @alarm.save
      AlarmJob.set(wait_until: @alarm.time).perform_later(@alarm)
      redirect_to alarms_path
    else
      flash.now[:messages] = @alarm.errors.full_messages[0]
      render :new
    end
    
  end

  def update
    if @alarm.update(alarm_params)
      redirect_to alarms_path
    else
      flash.now[:messages] = @alarm.errors.full_messages[0]
      render :edit
    end
  end

  def destroy
    @alarm.destroy
 
    redirect_to alarms_url, notice: 'Alarm was successfully deleted.'

  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_alarm
    @alarm = Alarm.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def alarm_params
    params.require(:alarm).permit(:time, :track, :device)
  end

end