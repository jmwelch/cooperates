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
		@transaction.purchase_date = Time.now
		@transaction.sold_to = current_user.id
		u = User.where(:username => params[:transaction][:bought_from])
		@transaction.bought_from = u.first.id

		if @transaction.save
			redirect_to @transaction
		else
			render 'new'
		end
	end
end
