class AddColumnToWorkingTimes < ActiveRecord::Migration
  def change
    add_column :working_times, :first_check_in, :integer
    add_column :working_times, :last_check_in, :integer
    add_column :working_times, :first_check_out, :integer
    add_column :working_times, :last_check_out, :integer
  end
end
