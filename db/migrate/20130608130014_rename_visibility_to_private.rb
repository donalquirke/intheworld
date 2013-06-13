class RenameVisibilityToPrivate < ActiveRecord::Migration
  def up
    rename_column :intentions, :visibility, :private
  end

  def down
  end
end
