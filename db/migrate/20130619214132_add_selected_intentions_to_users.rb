class AddSelectedIntentionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :selected_intentions, :integer
  end
end
