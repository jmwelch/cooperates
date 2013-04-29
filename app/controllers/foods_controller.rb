class FoodsController < ApplicationController

	def index
		@user = User.find(params[:id])
		@food = @user.foods
	end

	def show
		@food = Food.find(params[:id])
	end

	def new
		@food = Food.new
		2.times { @food.ingredients.build }
		@ings = Ingredient.select(:ingredient_name).uniq
	end

	def create
		@food = Food.new(params[:food])
		@food.user_id = current_user.id

		@food.ingredients.each do |i|
			i.user_id = current_user.id
		end

		if @food.save
			redirect_to @food
		else
			render 'new'
		end
	end
end
