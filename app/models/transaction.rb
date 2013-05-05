class Transaction < ActiveRecord::Base

	attr_accessible :ingredient_name, :purchase_date, :purchase_price, :quantity, :bought_from, :sold_to
end
