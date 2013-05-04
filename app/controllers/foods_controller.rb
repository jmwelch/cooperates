class FoodsController < ApplicationController

	def index
		@user = User.find(params[:id])
		@food = @user.foods
	end

	def show
		@food = Food.find(params[:id])
	end

	def new
		@user = User.find(params[:id])

		if current_user.id != params[:id].to_i
			redirect_to foods_show_path(@user.id), :notice => "You cannot edit #{@user.username}'s food!"
		end

		@food = Food.new
		@food.ingredients.build
		@ings = Ingredient.select(:ingredient_name).uniq
	end

	def create
		@food = Food.new(params[:food])
			@food.ingredients.each do |i|
				s = Stock.where(:ingredient_name => i.ingredient_name)
				if s.empty?
					flash[:notice] = "#{i.ingredient_name} not found in inventory. Please add it first!"
					render 'new' and return
				end
			end
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
		@user = User.find(params[:id])

		if current_user.id != params[:id].to_i
			redirect_to foods_show_path(@user.id), :notice => "You cannot edit #{@user.username}'s food!"
		end

    @food = Food.find(params[:id])
  end

  def update
		@user = User.find(params[:id])

		if current_user.id != params[:id].to_i
			redirect_to foods_show_path(@user.id), :notice => "You cannot edit #{@user.username}'s food!"
		end

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

	def sell
		@user = User.find(params[:id])
		@food = Food.find(params[:food_id])
		@ingredients = @food.ingredients
		@ingredients.each do |i|
			q = i.quantity_used
			s = Stock.where(:ingredient_name => i.ingredient_name).first
			if (s.quantity - q) < 0
				redirect_to foods_show_path(@user.id), :notice => "Not enough ingredients to sell #{@food.name}!" and return
			end
		end

		@ingredients.each do |i|
			q = i.quantity_used
			s = Stock.where(:ingredient_name => i.ingredient_name).first
			s.quantity = s.quantity - q
			s.save
		end

		redirect_to foods_show_path(@user.id), :notice => "You have sold one #{@food.name}!"
	end
end
