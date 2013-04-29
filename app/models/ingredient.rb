class Ingredient < ActiveRecord::Base

	belongs_to :user
	belongs_to :food

	attr_accessible :ingredient_name, :quantity_used
end
