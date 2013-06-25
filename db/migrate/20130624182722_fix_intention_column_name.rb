class FixIntentionColumnName < ActiveRecord::Migration
  def up
    rename_column :selected_intentions, :intention, :intention_id
  end

  def down
  end
end
