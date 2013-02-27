class CreateWorkingTimes < ActiveRecord::Migration
  def change
    create_table :working_times do |t|
      t.integer :hour

      t.timestamps
    end
  end
end
