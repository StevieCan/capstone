class CreateTeeTimeReminders < ActiveRecord::Migration[5.1]
  def change
    create_table :tee_time_reminders do |t|
      t.string :name
      t.string :phone_number
      t.datetime :time

      t.timestamps
    end
  end
end
