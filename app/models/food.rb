class Food < ActiveRecord::Base
  belongs_to :user#, :foreign_key => "food_id"

  # attr_accessible :title, :body
end
