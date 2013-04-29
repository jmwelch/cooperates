class Food < ActiveRecord::Base

	belongs_to :user
	has_many :ingredients, :dependent => :destroy

	accepts_nested_attributes_for :ingredients

	attr_accessible :name, :price
	attr_accessible :ingredients_attributes
end
