class InventoriesController < ApplicationController

	def index
		@user = User.find(params[:id])
		@inventory = @user.inventory
		@list = []
	end

	def show
		@inventory = Inventory.find(params[:id])
	end

  def new
    @inventory = Inventory.new
		ingredient = @inventory.ingredients.build
  end

	def create
		@inventory = Inventory.new(params[:inventory])
		@inventory.user_id = current_user.id
		@exists = Ingredient.last
		if !@exists.nil?
			@inventory.ingredient_id = @exists.id + 1
		else
			@inventory.ingredient_id = 1
		end

#		@first = Ingredient.first
#		if !@first.nil?
#			@exists = Ingredient.where("ingredient_name = ?", params[:inventory][:ingredients_attributes]["0"][:ingredient_name])
#			if !@exists.empty?
#				@inventory.ingredient_id = @exists.first.id
#			else
#				@inventory.ingredient_id = Ingredient.last.id + 1
#			end
#		else
#			@inventory.ingredient_id = 1
#		end
		if @inventory.save
			redirect_to @inventory
		else
			render 'new'
		end
	end
end
