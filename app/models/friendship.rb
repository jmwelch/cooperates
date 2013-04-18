class Friendship < ActiveRecord::Base
  belongs_to :user
	belongs_to :friend, :class_name => "User"

  attr_accessible :friend_id, :user_id


	UNRANSACKABLE_ATTRIBUTES = ["id", "user_id", "food_id"]
	def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  	end
end