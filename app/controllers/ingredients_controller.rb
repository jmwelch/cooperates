class IngredientsController < ApplicationController

	def index
		@user = User.find(params[:id])
		@ingredients = @user.ingredients
	end
end
