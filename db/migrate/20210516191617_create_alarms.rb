class CreateAlarms < ActiveRecord::Migration[6.1]
  def change
    create_table :alarms do |t|
      t.references :user, null: false, foreign_key: true
      t.time :time
      t.string :track
      t.string :device

      t.timestamps
    end
  end
end
