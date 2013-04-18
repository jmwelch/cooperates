class Recipe < ActiveRecord::Base
  belongs_to :food
  belongs_to :inventory

  UNRANSACKABLE_ATTRIBUTES = ["id", "recipe_id", "food_id"]
	def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  	end
end
