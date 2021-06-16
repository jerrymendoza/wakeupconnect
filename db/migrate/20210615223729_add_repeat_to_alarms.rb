class AddRepeatToAlarms < ActiveRecord::Migration[6.1]
  def change
    add_column :alarms, :repeat_daily, :boolean
  end
end
