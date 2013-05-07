class StocksController < ApplicationController

	def index
		@user = User.find(params[:id])
		@stock = @user.stocks

		if current_user.id != @user.id
			redirect_to user_path(@user), :notice => "You cannot view #{@user.username}'s inventory!"
		end
	end

	def show
		@stock = Stock.find(params[:id])
		@user = User.find(@stock.user_id)

		if current_user.id != @user.id
			redirect_to user_path(@user), :notice => "You cannot view #{@user.username}'s inventory!"
		end

		@last_trans = Transaction.where(:ingredient_name => @stock.ingredient_name, :sold_to => current_user.id).first
		if !@last_trans.nil?
			@supplier = User.find(@last_trans.bought_from)
		end
	end

	def new
		@user = User.find(params[:id])

		if current_user.id != @user.id
			redirect_to user_path(@user), :notice => "You cannot edit #{@user.username}'s inventory!"
		end

		@stock = Stock.new
	end

	def create
		@stock = Stock.new(params[:stock])
		@stock.user_id = current_user.id

		if current_user.user_type == 'supplier'
			@stock.low_quantity = 0
		end

		s = Stock.where(:ingredient_name => @stock.ingredient_name, :user_id => @stock.user_id)
		if !s.empty?
			redirect_to stock_path(s.first.id), :notice => "This ingredient is already in your inventory!" and return
		end

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
			redirect_to foods_show_path(@food.user_id), :notice => "You cannot edit #{@user.username}'s inventory!"
		end
	end

	def update
		@stock = Stock.new(params[:stock])
		@stock.user_id = current_user.id

		if current_user.user_type == 'supplier'
			@stock.low_quantity = 0
		end

		if @stock.save
			redirect_to @stock
		else
			render 'edit'
		end
	end

	def restock
		@user = User.find(params[:id])
		@stock = @user.stocks
		stock = Stock.where(:ingredient_name => params[:ingredient], :user_id => @user.id).first
		stock.quantity = stock.quantity + 10
		stock.save

		flash[:notice] = "#{stock.ingredient_name} increased by 10!"
		render 'index'
	end

	def import
		@stocks = []
		file = params[:file].tempfile
		CSV.foreach(file, :headers => true) do |row|
			stock = Stock.find_or_initialize_by_ingredient_name(row[0])
			stock.update_attributes(:ingredient_name => row[0], :quantity => row[1], :low_quantity => row[2])
			if stock.low_quantity.nil?
				stock.low_quantity = 0
			end
			if stock.quantity < 0
				stock.quantity = 0
			end
			stock.user_id = current_user.id
			stock.save
			@stocks.push(stock)
		end

		render 'upload'
	end
end
