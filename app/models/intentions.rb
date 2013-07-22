class Intentions < ActiveRecord::Base
  belongs_to :users
  attr_accessible :header, :details, :the_why, :footnotes, :addendum, :tags, :private, :user_id
end
