class AddVisibilityToIntentions < ActiveRecord::Migration
  def change
    add_column :intentions, :visibility, :integer
  end
end
