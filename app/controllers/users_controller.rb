class UsersController < ApplicationController
def index
@users = User.all
end

#def create
  #@users = User.new(params[:id])
 #redirect :action => :show
 # end

def show
    @users = User.find(params[:id])    
  end
end
