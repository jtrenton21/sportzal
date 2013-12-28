class UserSport < ActiveRecord::Base
  attr_accessible :experience, :hidden, :skill_level, :user_id, :sport_id, :availables_attributes, :group_id
  max_paginates_per 5
  belongs_to :user
  belongs_to :sport
  has_many :availables, :uniq => true
 
  accepts_nested_attributes_for :availables, :reject_if => proc {|attributes| attributes[:timeframe].blank?}, :allow_destroy => true
  

  scope :hidden, where(:hidden => true)
  scope :visible, where(:hidden => false)
  
 scope :matched, lambda {}
  def reject_availables(attributed)
  	attributed['daypart'].blank?
  end

  def users
    users = []
    User.transaction do
      self.user_ids.each do |user_id|
        begin
          users << User.find( user_id )
        rescue ActiveRecord::RecordNotFound
          return users
        end
      end
    end
    users.sort_by { rand }
  end
  
  def other_user
    UserSport.where(user_id != current_user.id)
  end



  def sport_match(user_sport)
    UserSport.find(sport_ids & user.sport_ids)
  end
end
