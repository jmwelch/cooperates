class UsersController < ApplicationController
  respond_to :html, :json
  
  before_filter :authenticate_user!#, except: [:index]

  def index
    @users = User.all
  end

  def search
    @search =User.search(params[:q])
    @users = @search.result

 # @search.build_condition if @search.conditions.empty?
 # @search.build_sort if @search.sorts.empty?
  end    

  def show
    @user = User.find(params[:id])
    
  end

  def new
  
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: "user was successfully created."
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
      respond_with @user
  end

  def destroy
    @user = user.find(params[:id])
    @user.destroy
    redirect_to users_url
  end
end
