class StocksController < ApplicationController

	def index
		@user = User.find(params[:id])
		@stock = @user.stocks
	end

	def show
		@stock = Stock.find(params[:id])
	end

	def new
		@user = User.find(params[:id])

		if current_user.id != params[:id].to_i
			redirect_to user_path(@user), :notice => "You cannot edit #{@user.username}'s inventory!"
		end

		@stock = Stock.new
	end

	def create
		@stock = Stock.new(params[:stock])
		@stock.user_id = current_user.id

		if @stock.save
			redirect_to @stock
		else
			render 'new'
		end
	end

	def edit
		@stock = Stock.find(params[:id])
		@user = User.find(@stock.user_id)

		if current_user.id != @stock.user_id
			redirect_to foods_show_path(@food.user_id), :notice => "You cannot edit #{@user.username}'s food!"
		end
	end

	def update
		@stock = Stock.new(params[:stock])
		@stock.user_id = current_user.id

		if @stock.save
			redirect_to @stock
		else
			render 'edit'
		end
	end

	def import
   	 	Stock.import(params[:file])
   	 	redirect_to root_url, notice: "Products imported"
  	end
end
