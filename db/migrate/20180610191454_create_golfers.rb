class CreateGolfers < ActiveRecord::Migration[5.1]
  def change
    create_table :golfers do |t|
      t.string :name
      t.integer :member_number
      t.string :caddy_preference_one
      t.string :caddy_preference_2
      t.string :caddy_preference_3
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
