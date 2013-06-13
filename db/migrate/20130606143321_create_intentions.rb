class CreateIntentions < ActiveRecord::Migration
  def up
    create_table :intentions do |t|
      t.string 'title'
      t.string 'details'
      t.string 'the_why'
      t.string 'note1'
      t.string 'note2'
      t.string 'note3'
      t.timestamps
    end
  end

  def down
    drop_table :intentions
  end
end
