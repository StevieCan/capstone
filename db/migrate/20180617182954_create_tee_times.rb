class CreateTeeTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :tee_times do |t|
      t.integer :caddy_id
      t.integer :golfer_id
      t.integer :location_id
      t.boolean :confirmed
      t.boolean :no_caddy
      t.boolean :cart
      t.integer :number_of_holds
      t.string :start_time

      t.timestamps
    end
  end
end
