class Registerations < ActiveRecord::Base
  attr_accessible :email
  validates_presence_of :email, :on => :create
end
