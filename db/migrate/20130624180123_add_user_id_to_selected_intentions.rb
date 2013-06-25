class AddUserIdToSelectedIntentions < ActiveRecord::Migration
  def change
    add_column :selected_intentions, :user_id, :integer
  end
end
