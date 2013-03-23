class Food < ActiveRecord::Base
  belongs_to :user
  has_many :recipe
  # attr_accessible :title, :body
end
