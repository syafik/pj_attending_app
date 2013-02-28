class RemoveWorkingTimeFromAbsents < ActiveRecord::Migration
  def up
    remove_column :absents, :working_time
  end

  def down
    add_column :absents, :working_time, :integer
  end
end
