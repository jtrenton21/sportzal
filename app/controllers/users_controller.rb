class UsersController < ApplicationController
before_filter :authenticate_user!

	def dashboard
	    @users = User.all
	   	@user = current_user
	    @user_sport = UserSport.new
	    @user_sports = current_user.user_sports
	    @sport = Sport.all
	    @sports = current_user.sports
	   #  @meeting = Meeting.new
	   #  @mymeetings = current_user.meetings
	   #  @user_meetings = UserMeeting.all
	   #  @meetings = UserMeeting.all
	  	# @matchmeetings = get_match
	  	
	  	# raise
    end


end
