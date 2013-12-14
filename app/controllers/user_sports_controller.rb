class UserSportsController < ApplicationController
  # GET /user_sports
  # GET /user_sports.json
  def index
    @user_sports = UserSport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_sports }
    end
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
    @user_sport = UserSport.new(params[:user_sport])

    respond_to do |format|
      if @user_sport.save
        format.html { redirect_to @user_sport, notice: 'User sport was successfully created.' }
        format.json { render json: @user_sport, status: :created, location: @user_sport }
      else
        format.html { render action: "new" }
        format.json { render json: @user_sport.errors, status: :unprocessable_entity }
      end
    end
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
