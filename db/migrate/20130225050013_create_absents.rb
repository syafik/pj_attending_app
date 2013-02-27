class CreateAbsents < ActiveRecord::Migration
  def change
    create_table :absents do |t|
      t.date :working_date
      t.integer :time_in
      t.integer :time_out
      t.integer :working_time

      t.timestamps
    end
  end
end
