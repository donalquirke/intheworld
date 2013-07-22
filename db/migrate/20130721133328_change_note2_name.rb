class ChangeNote2Name < ActiveRecord::Migration
  def change
    rename_column :intentions, :note2, :addendum
  end
end
