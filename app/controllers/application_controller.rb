class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :vars
def vars
  @allusers = User.find(:all)
  @allingredients = Ingredient.find(:all)
  @allfoods = Food.find(:all)
end
end
