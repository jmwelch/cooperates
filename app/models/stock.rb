class Stock < ActiveRecord::Base

	belongs_to :user

	attr_accessible :ingredient_name, :quantity, :low_quantity, :user_id

	def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
    	stock = find_by_ingredient_name(row["ingredient_name"]) || new
        stock.attributes = row.to_hash.slice(*accessible_attributes)
        stock.save!
    end
  end

end
