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
end
