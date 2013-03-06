class ChangeDataTypeFromAbsents < ActiveRecord::Migration
  def up
    rename_column :absents, :time_in, :time_in_edit
    rename_column :absents, :time_out, :time_out_edit
    add_column :absents, :time_in, :datetime
    add_column :absents, :time_out, :datetime
    remove_column :absents, :time_in_edit
    remove_column :absents, :time_out_edit
  end

  def down
    remove_column :absents, :time_in, :datetime
    remove_column :absents, :time_out, :datetime
    remove_column :absents, :time_in, :integer
    remove_column :absents, :time_out, :intger
  end
end
