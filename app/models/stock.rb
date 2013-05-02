class Stock < ActiveRecord::Base

	belongs_to :user

	attr_accessible :ingredient_name, :quantity, :low_quantity
end
