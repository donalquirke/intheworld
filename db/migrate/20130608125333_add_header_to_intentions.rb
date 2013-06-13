class AddHeaderToIntentions < ActiveRecord::Migration
  def change
    add_column :intentions, :header, :string
  end
end
