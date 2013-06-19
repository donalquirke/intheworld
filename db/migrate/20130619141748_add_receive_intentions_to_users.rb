class AddReceiveIntentionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recieve_intentions, :boolean
  end
end
