class User < ActiveRecord::Base

	has_many :ingredients, :dependent => :destroy
	has_many :foods, :dependent => :destroy
	has_many :stocks, :dependent => :destroy


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :description, :price_range, :user_type, :rating, :cuisine,
  :email, :password, :password_confirmation, :remember_me, :address, :longitude, :latitude
  # attr_accessible :title, :body
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  UNRANSACKABLE_ATTRIBUTES = ["id", "price_range", "rating", "cuisine", "encrypted_password", 
    "reset_password_token", "reset_password_sent_at", "remember_created_at", 
    "sign_in_count", "current_sign_in_at", "last_sign_in_at", "current_sign_in_ip", "last_sign_in_ip",
    "created_at", "updated_at", "longitude", "latitude"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
