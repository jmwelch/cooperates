class User < ActiveRecord::Base
	set_primary_key :id

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  #has_many :food#, :foreign_key => 'user_id'

  has_many :activities
  
###########################
  has_many :inventory 
  has_many :ingredient, :through => :inventory 
  has_many :recipe, :through => :inventory
###########################
  has_many :food
  has_many :recipe, :through => :food
###########################



  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :user_type, :description, :price_range, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end