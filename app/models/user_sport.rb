class UserSport < ActiveRecord::Base
  attr_accessible :experience, :skill_level, :user_id, :sport_id
  belongs_to :user
  belongs_to :sport
  
end
