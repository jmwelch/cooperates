class TransactionsController < ApplicationController

	def index
		if current_user.id != params[:id].to_i
			redirect_to user_path(params[:id]), :notice => "You can't edit other's transactions!"
		end
		@trans = Transaction.where(:sold_to => current_user.id)

		@transactions = []
		@trans.each do |t|
			u = User.find(t.bought_from)
			@transactions.push([t, u.username])
		end
	end

	def show
		@transaction = Transaction.find(params[:id])
		@supplier = User.find(@transaction.bought_from)
	end

	def new
		if current_user.id != params[:id].to_i
			redirect_to user_path(params[:id]), :notice => "You can't make a transactions for others!"
		end
		@transaction = Transaction.new
	end

	def create
		@transaction = Transaction.new(params[:transaction])
		u = User.where(:username => params[:transaction][:bought_from])
		# If the supplier is not found, redirect
		if u.empty?
			flash[:notice] = "Supplier #{params[:transaction][:bought_from]} not found!"
			render 'new', :food => params[:transaction][:ingredient_name] and return
		end

		# Make sure the supplier has that ingredient
		u = u.first
		ings = u.stocks
		has_it = false
		ings.each do |i|
			if i.ingredient_name == @transaction.ingredient_name
				has_it = true and break
			end
		end
		if has_it == false
			flash[:notice] = "Supplier #{params[:transaction][:bought_from]} does not have #{@transaction.ingredient_name}!"
			render 'new', :food => params[:transaction][:ingredient_name] and return
		end

		# Make sure the supplier has enough of that ingredient
		ing = ings.where(:ingredient_name => @transaction.ingredient_name).first
		if ing.quantity < @transaction.quantity
			flash[:notice] = "Supplier #{params[:transaction][:bought_from]} does not have sufficient supplies!"
			render 'new', :food => params[:transaction][:ingredient_name] and return
		end

		# If the ingredient purchased is not already listed in Stock, add it
		stock = Stock.where(:ingredient_name => params[:transaction][:ingredient_name], :user_id => current_user.id)
		if stock.empty?
			stock = Stock.create(:ingredient_name => params[:transaction][:ingredient_name], :quantity => 0, :user_id => current_user.id, :low_quantity => 0)
			flash[:notice] = "Please don't forget to update ingredient #{stock.ingredient_name} with its information"
		end

		@transaction.purchase_date = Time.now
		@transaction.sold_to = current_user.id
		@transaction.bought_from = u.id

		# Update relevant Stock levels
		stock = Stock.where(:ingredient_name => params[:transaction][:ingredient_name], :user_id => @transaction.bought_from).first
		stock.quantity = stock.quantity - @transaction.quantity
		stock.save
		stock = Stock.where(:ingredient_name => params[:transaction][:ingredient_name], :user_id => @transaction.sold_to).first
		stock.quantity = stock.quantity - @transaction.quantity
		stock.save

		if @transaction.save
			redirect_to @transaction
		else
			render 'new'
		end
	end
end
