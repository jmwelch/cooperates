class StocksController < ApplicationController

	def index
		@user = User.find(params[:id])
		@stock = @user.stocks
	end

	def show
		@stock = Stock.find(params[:id])
	end

	def new
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

	def csv

	end
end
