class SelectedIntention < ActiveRecord::Base
  belongs_to :users
  attr_accessible :intention
end
