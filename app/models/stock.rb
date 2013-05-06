class Stock < ActiveRecord::Base

	belongs_to :user

	attr_accessible :ingredient_name, :quantity, :low_quantity, :user_id

	def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
    Stock.create! row.to_hash
	end
  	end

end
