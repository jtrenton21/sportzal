class UserSportsController < ApplicationController
  # GET /user_sports
  # GET /user_sports.json
  def index
    @user_sports = UserSport.all
    @thuser_sports = get_match


     # @theuser_sports = UserSport.joins(:availables).where(true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_sports }
    end
  end

  def get_match
    @user_sport = UserSport.includes(:availables)
    # @available = Available.all
    @mysport = current_user.user_sports
    UserSport.where(:sport_id => @mysport.third.sport.id)
    # UserSport.joins(:availables).where(:timeframe => available.first.timeframe)
    
    # UserSport.where(@mysport.last.sport.id == @user_sport.last.sport.id && current_user.id != @user_sport.first.user_id)
    
  end

  # GET /user_sports/1
  # GET /user_sports/1.json
  def show
    @user_sport = UserSport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_sport }
    end
  end

  # GET /user_sports/new
  # GET /user_sports/new.json
  def new
    @user_sport = UserSport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_sport }
    end
  end

  # GET /user_sports/1/edit
  def edit
    @user_sport = UserSport.find(params[:id])
  end

  # POST /user_sports
  # POST /user_sports.json
  def create
    @user_sport = current_user.user_sports.create(params[:user_sport])

    redirect_to user_root_path
  end

  # PUT /user_sports/1
  # PUT /user_sports/1.json
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

  # DELETE /user_sports/1
  # DELETE /user_sports/1.json
  def destroy
    @user_sport = UserSport.find(params[:id])
    @user_sport.destroy

    respond_to do |format|
      format.html { redirect_to user_sports_url }
      format.json { head :no_content }
    end
  end
end
