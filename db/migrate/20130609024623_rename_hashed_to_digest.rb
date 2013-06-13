class RenameHashedToDigest < ActiveRecord::Migration
  def up
    rename_column :users, :hashed_password, :password_digest
  end

  def down
  end
end
