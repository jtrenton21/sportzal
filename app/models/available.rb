class Available < ActiveRecord::Base
  attr_accessible :timeframe, :weekday, :daypart, :user_sport_id

  belongs_to :user_sport, inverse_of: :available
  # has_many :user_availables
  # has_many :users, through: :user_availables
  
end
