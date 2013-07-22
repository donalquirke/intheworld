class ChangeNote1Name < ActiveRecord::Migration
  def change
    rename_column :intentions, :note1, :footnotes
  end
end
