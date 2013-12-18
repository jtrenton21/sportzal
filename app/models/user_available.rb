class UserAvailable < ActiveRecord::Base
  attr_accessible :user_id, :available_id, :from, :until
  belongs_to :user
  belongs_to :available
  
end
