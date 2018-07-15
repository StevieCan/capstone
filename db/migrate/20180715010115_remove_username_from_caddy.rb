class RemoveUsernameFromCaddy < ActiveRecord::Migration[5.1]
  def change
    remove_column :caddies, :username, :string
  end
end
