class ChangePrivateDatatype < ActiveRecord::Migration
  def up
      remove_column :intentions, :private
      add_column :intentions, :private, :boolean
      #change_table :intentions do |t|
      #t.change :private, :boolean
  end

  def down
  end
end
