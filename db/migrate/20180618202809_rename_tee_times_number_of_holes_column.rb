class RenameTeeTimesNumberOfHolesColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :tee_times, :number_of_holds, :number_of_holes
  end
end
