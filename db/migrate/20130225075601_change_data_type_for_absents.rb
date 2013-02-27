class ChangeDataTypeForAbsents < ActiveRecord::Migration
  def up
    change_table :absents do |t|
      t.change :working_date, :datetime
    end
  end

  def down
    change_table :absents do |t|
      t.change :working_date, :datetime
    end
  end
end
