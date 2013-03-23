class Recipe < ActiveRecord::Base
  belongs_to :food

  # attr_accessible :title, :body
end
