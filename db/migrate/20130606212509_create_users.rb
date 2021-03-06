class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string 'first_name'
      t.string 'second_name'
      t.string 'hashed_password'
      t.string 'salt'
      t.timestamps
    end
  end
  
  def down
    drop_table :users
  end
  
end
