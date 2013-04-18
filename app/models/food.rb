class Food < ActiveRecord::Base
  set_primary_key :id
  belongs_to :user
  has_many :recipe

	attr_accessible :fname, :price

	UNRANSACKABLE_ATTRIBUTES = ["id", "user_id"]
	def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  	end
end
