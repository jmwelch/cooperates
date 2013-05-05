class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :vars
def vars
	@test = ""
  @allusers = User.find(:all)
  @allingredients = Ingredient.find(:all)
  @allfoods = Food.find(:all)
  @allstocks = Stock.find(:all)
  @alltransactions = Transaction.find(:all)
end
end
