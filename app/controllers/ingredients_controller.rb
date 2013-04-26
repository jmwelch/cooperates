class IngredientsController < ApplicationController

	def index
		@user = User.find(params[:id])
		@ingredients = @user.ingredients
	end

	def show
		@ingredient = Ingredient.find(params[:id])
	end

	def new
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.new(params[:ingredient])
		@ingredient.user_id = current_user.id

		if @ingredient.save
			redirect_to @ingredient
		else
			render 'new'
		end
	end
end
