class Ingredient < ActiveRecord::Base
	belongs_to :inventory
	UNRANSACKABLE_ATTRIBUTES = ["id", "inventory_id" ]
	def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  	end
end
