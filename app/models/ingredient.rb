class Ingredient < ActiveRecord::Base
	belongs_to :inventory

	attr_accessible :ingredient_name

end
