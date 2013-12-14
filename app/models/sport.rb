class Sport < ActiveRecord::Base
  attr_accessible :name

  has_many :user_sports
  has_many :users, through: :user_sports

end
