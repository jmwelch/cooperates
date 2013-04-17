class InventoriesController < ApplicationController

	def index
		@user = User.find(params[:id])
		@inventory = @user.inventory
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
		@first = Ingredient.first
		if !@first.nil?
			@exists = Ingredient.where("ingredient_name = ?", params[:inventory][:ingredient_name])
			if !@exists.empty?
				@inventory.ingredient_id = @exists.first.ingredient_id
			else
				@inventory.ingredient_id = Ingredient.last.id + 1
			end
		else
			@inventory.ingredient_id = 1
		end
		if @inventory.save
			redirect_to @inventory
		else
			render 'new'
		end
	end
end
