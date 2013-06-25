class CreateSelectedIntentions < ActiveRecord::Migration
  def change
    create_table :selected_intentions do |t|
      t.integer :intention

      t.timestamps
    end
  end
end
