class FoodsController < ApplicationController

  def show
    @food = Food.where("food_id = ?", params[:id]).first
		@uid = @food.user_id
		@user = User.find(@uid)
  end

  def index
    @user = User.find(params[:id])
		@food = @user.food
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(params[:food])
		@food.user_id = current_user.id
    if @food.save
			#redirect_to '/users/%{current_user.id}/food'
			#redirect_to food_path(@food.id)
			redirect_to @food
      #redirect_to @food, notice: "food was successfully created.", :uid => current_user.id
			#redirect_to 'www.google.com'
			#redirect_to 
    else
      render "new"
    end
  end
end
