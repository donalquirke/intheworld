class ChangePrivateDatatype < ActiveRecord::Migration
  def up
      change_table :intentions do |t|
      t.change :private, :boolean
    end
  end

  def down
  end
end
