class FixRecieveColumn < ActiveRecord::Migration
  def up
    rename_column :users, :recieve_intentions, :receive_intentions
  end

  def down
  end
end
