class User < ActiveRecord::Base

	has_many :ingredients, :dependent => :destroy
	has_many :foods, :dependent => :destroy
	has_many :stocks, :dependent => :destroy

  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.search(params)
    tire.search(load: true) do
      query { string params[:query], default_operator: "AND" } if params[:query].present?
    end
  end

    mapping do
    indexes :username, type: 'string'
    indexes :user_type, type: 'string'
    indexes :description, type: 'string'
    indexes :rating,  type: 'integer'
    indexes :email,  type: 'string'
    indexes :cuisine,  type: 'string'

    indexes :foods do
      indexes :name,  type: 'string'
    end
  end
  
    indexes :ingredients do
      indexes :ingredient_name,  type: 'string'
    end
  
  # Define the JSON serialization
  #
  def to_indexed_json
    to_json( include: { ingredients: { only: [:ingredient_name] 
                                     } ,
                        foods: { only: [:name] 
                               },
                        stocks:{ only: [:ingredient_name] 
                               }
                      } )
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :description, :price_range, :user_type, :rating, :cuisine,
  :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

end
