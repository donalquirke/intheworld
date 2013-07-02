class Users < ActiveRecord::Base
  has_many :intentions
  has_many :selected_intentions
  
  has_secure_password
  attr_accessible :first_name, :second_name, :password_digest, :email, :password, :password_confirmation, :receive_intentions

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create  
end
