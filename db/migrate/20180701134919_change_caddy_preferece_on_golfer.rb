class ChangeCaddyPrefereceOnGolfer < ActiveRecord::Migration[5.1]
  def change
    remove_column :golfers, :caddy_preference_one, :string
    remove_column :golfers, :caddy_preference_2,  :string
    remove_column :golfers, :caddy_preference_3, :string

    add_column :golfers, :caddy_preference_1, :integer
    add_column :golfers, :caddy_preference_2,  :integer
    add_column :golfers, :caddy_preference_3, :integer

  end
end
