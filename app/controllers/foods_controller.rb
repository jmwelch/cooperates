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
		@food.ingredients.build
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

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])

		if @food.update_attributes(params[:food])
			redirect_to @food
		else
			render "edit"
		end
	end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

		redirect_to foods_show_url(:id => current_user.id)
  end
end
