class UserSport < ActiveRecord::Base
  attr_accessible :experience, :skill_level, :user_id, :sport_id, :availables_attributes
  belongs_to :user
  belongs_to :sport
  has_many :availables

  accepts_nested_attributes_for :availables, :reject_if => proc {|attributes| attributes[:timeframe].blank?}, :allow_destroy => true
  



  def reject_availables(attributed)
  	attributed['daypart'].blank?
  end



end
