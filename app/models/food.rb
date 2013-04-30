class Food < ActiveRecord::Base

	belongs_to :user
	has_many :ingredients, :dependent => :destroy

	attr_accessible :name, :price
	attr_accessible :ingredients_attributes

	accepts_nested_attributes_for :ingredients, :allow_destroy => true
end
