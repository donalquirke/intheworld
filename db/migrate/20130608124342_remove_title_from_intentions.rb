class RemoveTitleFromIntentions < ActiveRecord::Migration
  def up
    remove_column :intentions, :title
  end

  def down
    add_column :intentions, :title, :string
  end
end
