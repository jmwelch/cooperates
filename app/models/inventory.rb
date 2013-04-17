class Inventory < ActiveRecord::Base
  belongs_to :user
  has_many :recipes
  has_many :ingredients

	attr_accessible :purchase_date, :purchase_price, :quantity_bought, :ingredients_attributes

	accepts_nested_attributes_for :ingredients
end
