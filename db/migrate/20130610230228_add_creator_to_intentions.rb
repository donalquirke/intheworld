class AddCreatorToIntentions < ActiveRecord::Migration
  def change
    add_column :intentions, :creator, :integer
  end
end
