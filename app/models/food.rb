class Food < ActiveRecord::Base
  set_primary_key :id
  belongs_to :user
  has_many :recipe

	attr_accessible :fname, :price
end
