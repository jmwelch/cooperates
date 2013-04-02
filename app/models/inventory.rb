class Inventory < ActiveRecord::Base
  belongs_to :user
  has_many :recipe
  has_many :ingredient
end
