class Sport < ActiveRecord::Base
  attr_accessible :name

  has_many :user_sports
  # has_many :users, through: :user_sports
  has_and_belongs_to_many :users
  accepts_nested_attributes_for :user_sports
end
