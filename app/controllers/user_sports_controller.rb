class UserSportsController < ApplicationController
  
  def index
    @user_sports = UserSport.order(:id).page(params[:page]).per(5)
    @zuser_sports = UserSport.all
    @thuser_sports = get_sports_and_favorites
    
    # @thuser_sports = get_match
    # @search = UserSport.search(params[:q])
    # @user_sports = @search.result
    # @search.build_condition
  end

  def action
    @lat_lng = cookies[:lat_lng].split("|")
  end
     

  # def search
  #   index
  #   render :index
  # end
  # def get_all
  #  @user_sports = UserSport.joins(:availables).select("user_sports.*, availables.timeframe as timerame").all
  #  @mysport = current_user.user_sports
  #  @myavailables = Array.new

  #   @user_sports.uniq.each do |user_sport|
  #         @test = UserSport.where(:user_id => user_sport.user.id)
  #       end
  # end
  
  def get_match
    
    if (params["/dashboard"])
      user_sport = UserSport.find(params["/dashboard"]["id"])
      UserSport.where(:timeframe => user_sport.timeframe ).where(:sport_id => user_sport.sport_id)
      
end
    
  

    # @otuser_sports = UserSport.joins(:availables).select("user_sports.*, availables.timeframe").uniq
    # @otuser_sports = UserSport.joins(:availables).filter(:sport_id => 'sport_id')
    # @mysports = current_user.user_sports 
    # @soco= @otuser_sports.where(true).except(@mysports)
  #  @sport = Sport.all 
  # @sport.group.user_sports

    
 
    
    # @otuser_sports.each do  |otuser_sport| 
    # unless otuser_sport.sport_id != mysport.sport_id
    
  
  # end
# end
    # # @sort = Array.new
    # # @thuser_sports.each do |thuser_sport|
    # # #   UserSport.joins(:availables).select("user_sports.*, availables.timeframe").all
    # @otuser_sports.each do |otuser_sport|
    #  @sox = UserSport.where(:sport_id => otuser_sport.sport_id)
     
    # end
  
    # @getz = UserSport.find(:all, :conditions => { :sport_id => @mysports.first.sport_id})
    # @gotz = UserSport.where(sport_id: @mysports.first.sport_id).to_a
    # @pok =  @mysports + @otuser_sports
    # @gillz = UserSport.find_by_sql("SELECT * user_sports.sport_id FROM user_sports ")

    # UserSport.where(:sport_id => otuser_sport.sport_id).all
    # # UserSport.where(:sport_id => mysport.sport_id)
    # @mysports & @thuser_sports == @mysports
    # @sort << @diff
    # # UserSport.where(:sport_id => mysport.sport_id ).uniq
    # # @yo = UserSport.where(@mysports.last.sport_id == @thuser_sports.last.sport_id).all
    # raise
    # end
   
  end

  

  
  
  def show
    @user_sport = UserSport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_sport }
    end
  end

  
  def new
    @user_sport = UserSport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_sport }
    end
  end

 
  def edit
    @user_sport = UserSport.find(params[:id])
  end

  
  # def create
  # @user_sport = current_user.user_sports.build(params[:user_sport])
  #   @user_sport.save
  #   redirect_to user_root_path
  # end
def create
   @sport = Sport.all
   @user_sport = current_user.user_sports.build(params[:user_sport])
  # @sport = Sport.find(params[:sport_id])
  # @user = User.find(current_user.id)
  @user_sport.save
  # if @user_sport << @sport
    get_sports_and_favorites
    
    redirect_to user_root_path
  
end
  
  def update
    @user_sport = UserSport.find(params[:id])

    respond_to do |format|
      if @user_sport.update_attributes(params[:user_sport])
        format.html { redirect_to @user_sport, notice: 'User sport was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_sport.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @user_sport = UserSport.find(params[:id])
    @user_sport.destroy

    respond_to do |format|
      format.html { redirect_to user_sports_url }
      format.json { head :no_content }
    end
  end

  # private
    def get_sports_and_favorites
      @user = User.find(current_user.id)
      @sport = Sport.all
      @favorites = current_user.user_sports
       e = @favorites.pluck(:sport_id) #means that to select user.id from usersports
      # arr = e.join(",")
      @thesports = UserSport.where(:sport_id => e)
  
    end



end
