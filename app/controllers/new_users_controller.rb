class NewUsersController < ApplicationController
  # GET /new_users
  # GET /new_users.json
  def index
    @new_users = NewUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @new_users }
    end
  end

  # GET /new_users/1
  # GET /new_users/1.json
  def show
    @new_user = NewUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @new_user }
    end
  end

  # GET /new_users/new
  # GET /new_users/new.json
  def new
    @new_user = NewUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @new_user }
    end
  end

  # GET /new_users/1/edit
  def edit
    @new_user = NewUser.find(params[:id])
  end

  # POST /new_users
  # POST /new_users.json
  def create
    @new_user = NewUser.new(params[:new_user])

    respond_to do |format|
      if @new_user.save
        format.html { redirect_to @new_user, notice: 'New user was successfully created.' }
        format.json { render json: @new_user, status: :created, location: @new_user }
      else
        format.html { render action: "new" }
        format.json { render json: @new_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /new_users/1
  # PUT /new_users/1.json
  def update
    @new_user = NewUser.find(params[:id])

    respond_to do |format|
      if @new_user.update_attributes(params[:new_user])
        format.html { redirect_to @new_user, notice: 'New user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @new_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_users/1
  # DELETE /new_users/1.json
  def destroy
    @new_user = NewUser.find(params[:id])
    @new_user.destroy

    respond_to do |format|
      format.html { redirect_to new_users_url }
      format.json { head :no_content }
    end
  end
end
