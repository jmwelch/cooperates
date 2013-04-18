class User < ActiveRecord::Base
	set_primary_key :id

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :user_type, :description, :price_range,:address, :latitude, :longitude, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

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

  UNRANSACKABLE_ATTRIBUTES = ["id", "encrypted_password","reset_password_token", "reset_password_sent_at", "remember_created_at",
    "sign_in_count", "current_sign_in_at", "last_sign_in_at", "current_sign_in_ip", "last_sign_in_ip",
    "created_at", "updated_at" ]
  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
end