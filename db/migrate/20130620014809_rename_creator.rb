class RenameCreator < ActiveRecord::Migration
  def up
    rename_column :intentions, :creator, :user_id
  end

  def down
  end
end
