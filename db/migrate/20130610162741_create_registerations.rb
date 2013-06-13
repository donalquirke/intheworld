class CreateRegisterations < ActiveRecord::Migration
  def change
    create_table :registerations do |t|
      t.string  :email
      t.boolean :setup
      t.timestamps
    end
  end
end
