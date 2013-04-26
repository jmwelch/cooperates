class Food < ActiveRecord::Base

	belongs_to :user

	attr_accessible :name, :price
end
