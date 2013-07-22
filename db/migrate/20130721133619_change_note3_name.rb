class ChangeNote3Name < ActiveRecord::Migration
  def change
    rename_column :intentions, :note3, :tags
  end
end
