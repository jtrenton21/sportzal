class FavoriteController < ApplicationController

  def new
  end

  def create

  	@sport = Sport.find(params[:sport_id])
  	@user = User.find(current_user.id)
	respond_to do |format|
      if @user.sports << [@sport]
  		redirect_to user_root_path
	end
  end

  def destroy
	respond_to do | format |
  	  if User.find(current_user.id).sports.destroy(Sport.find(params[:sport_id]))
  		get_sports_and_favorites
		redirect_to user_root_path
	end
  end

  private

  	def get_sports_and_favorites
  		@user = User.find(current_user.id)
  		@favorites = @user.sports.order('name ASC')
	    e = @user.user_sports.pluck(:sport_id)
	    arr = e.join(",")
	    @sports = sport.where("id not in (#{arr})").order('name ASC')
  	end
    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:sport_id, :user_id)
    end
end


