class Food < ActiveRecord::Base
  belongs_to :user, :foreign_key => "uid"

  # attr_accessible :title, :body
end
