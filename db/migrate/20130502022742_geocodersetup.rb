class Geocodersetup < ActiveRecord::Migration
	def up

		add_column :users, :longitude, :float
		add_column :users, :latitude, :float
	end

	def down
	end
end
