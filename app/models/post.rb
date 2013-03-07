class Post < ActiveRecord::Base
  'acts_as_taggable'
  has_many :comments, dependent: :destroy
  attr_accessible :text, :title, :tag_list, :tags
  validates :title, presence: true,
                    length: { minimum: 5 }
  

end
