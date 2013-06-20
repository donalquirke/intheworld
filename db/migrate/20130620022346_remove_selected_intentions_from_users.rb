class RemoveSelectedIntentionsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :selected_intentions
  end

  def down
    add_column :users, :selected_intentions, :integer
  end
end
