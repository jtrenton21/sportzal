class User < ActiveRecord::Base
  attr_accessible :email, :password, :locations_attributes, :password_confirmation, :remember_me, :first_name, :last_name, :zip, :photo, :user_sports_attributes, :user_availables_attributes
  
  serialize :omniauth_data, JSON
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable , :omniauthable

  has_many :invitations, :class_name => self.to_s, :as => :invited_by
  has_many :messages, class_name: 'Message', foreign_key: 'user_id'
  has_many :user_availables
 
  has_many :user_sports
  has_and_belongs_to_many :sports
  has_many :availables, through: :user_availables
  accepts_nested_attributes_for :user_sports

  has_attached_file :photo, 
            :default_url => '/assets/images/avatar/default.JPG',
            :styles => { :export => {:geometry => "50x550#", :quality => 100, :format => 'JPG'} },
            :convert_options => { :all => "-quality 100" },
            :processor => "mini_magick",
            :url  => "/assets/images/avatar/:basename.:extension",
            :path => ":rails_root/public/assets/images/avatar/:basename.:extension"

  
  scope :match_to, lambda { |sport_names| joins(:sports).where("sports.name IN (?)", sport_names).group("users.id") }  
  
    
  def other_user
    User.where(user_id != current_user.id)
  end
  def name
    return "#{self.first_name} #{self.last_name}"
  end

  def message_title
    "#{prefix} <#{email}>"
  end

  def mailbox
    Mailbox.new(self)
  end


end
