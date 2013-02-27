class AddUserIdToAbsents < ActiveRecord::Migration
  def change
    add_column :absents, :user_id, :integer
  end
end
