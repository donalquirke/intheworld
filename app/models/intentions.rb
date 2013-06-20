class Intentions < ActiveRecord::Base
  belongs_to :users
  attr_accessible :header, :details, :the_why, :note1, :note2, :note3, :private, :user_id
end
