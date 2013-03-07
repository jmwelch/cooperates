class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  attr_accessible :create, :destroy, :friend_id, :user_id
end
