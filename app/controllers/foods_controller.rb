class FoodsController < ApplicationController

  def show
    @user = User.find(params[:id])
		@food = @user.food
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
		@food.id = 1
    if @food.save
			#redirect_to '/users/%{current_user.id}/food'
			redirect_to food_path(@food.id)
      #redirect_to @food, notice: "food was successfully created."
    else
      render "new"
    end
  end
end
