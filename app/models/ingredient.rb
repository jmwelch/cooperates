class Ingredient < ActiveRecord::Base

	belongs_to :user

	attr_accessible :ingredient_name, :quantity_used
end
