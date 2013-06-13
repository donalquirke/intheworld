class ChangeDetailsType < ActiveRecord::Migration
  def up
    change_table :intentions do |t|
      t.change :details, :text, :limit => 3000
      t.change :the_why, :text, :limit => 3000
      t.change :note1, :text, :limit => 3000
      t.change :note2, :text, :limit => 3000
      t.change :note3, :text, :limit => 3000
    end
  end

  def down
    change_table :intentions do |t|
      t.change :details, :string
      t.change :the_why, :string
      t.change :note1, :string
      t.change :note2, :string
      t.change :note3, :string
    end
  end
end
