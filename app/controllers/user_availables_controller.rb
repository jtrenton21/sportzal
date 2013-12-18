class UserAvailablesController < ApplicationController
  # GET /user_availables
  # GET /user_availables.json
  def index
    @user_availables = UserAvailable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_availables }
    end
  end

  # GET /user_availables/1
  # GET /user_availables/1.json
  def show
    @user_available = UserAvailable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_available }
    end
  end

  # GET /user_availables/new
  # GET /user_availables/new.json
  def new
    @user_available = UserAvailable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_available }
    end
  end

  # GET /user_availables/1/edit
  def edit
    @user_available = UserAvailable.find(params[:id])
  end

  # POST /user_availables
  # POST /user_availables.json
  def create
    @user_available = UserAvailable.new(params[:user_available])

    respond_to do |format|
      if @user_available.save
        format.html { redirect_to @user_available, notice: 'User available was successfully created.' }
        format.json { render json: @user_available, status: :created, location: @user_available }
      else
        format.html { render action: "new" }
        format.json { render json: @user_available.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_availables/1
  # PUT /user_availables/1.json
  def update
    @user_available = UserAvailable.find(params[:id])

    respond_to do |format|
      if @user_available.update_attributes(params[:user_available])
        format.html { redirect_to @user_available, notice: 'User available was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_available.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_availables/1
  # DELETE /user_availables/1.json
  def destroy
    @user_available = UserAvailable.find(params[:id])
    @user_available.destroy

    respond_to do |format|
      format.html { redirect_to user_availables_url }
      format.json { head :no_content }
    end
  end
end
