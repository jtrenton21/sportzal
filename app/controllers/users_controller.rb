class UsersController < ApplicationController
# before_filter :authenticate_user!

	def list
		@users= User.all
	end

	def myprofile
		@user = current_user
	end


	def dashboard
	    @users = User.all
	   	@user = current_user
	    @user_sport = UserSport.new
	   	@myuser_sport = current_user.user_sports.create(params[:user_sport])
	    @user_sport.availables.build
	    @user_sports = current_user.user_sports
	    @sport = Sport.all
	    @mysports = current_user.user_sports
	    @availables = Available.all
	    @allsports = UserSport.all
	    # @myuser_sports= get_match
	    # @user_available = UserAvailable.new


	   #  @meeting = Meeting.new
	   #  @mymeetings = current_user.meetings
	   #  @user_meetings = UserMeeting.all
	   #  @meetings = UserMeeting.all
	  	# @matchmeetings = get_match
	  	
	  	# raise
    end

    def get_match
		if (params["/dashboard"])
			user_sport = UserSport.find(params["/dashboard"]["id"])

			# user_sport = UserSport.all(:joins => :available)
			# UserSport.where(:weekday => user_sport.available.weekday ).where(:sport_id => user_sport.sport_id)
	 		UserSport.where(:sport_id => user_sport.sport_id).where(:available_id => user_sport.available_id).where(:daypart => user_sport.daypart)
	 	end
	end


end
