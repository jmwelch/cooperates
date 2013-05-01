# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

panera = User.create! email: 'pan@er.a', 
					  password: 'panera', 
					  username: 'panera', 
					  user_type: 'restaurant', 
					  description: 'fast-casual, bought bread company, always tries to get me to sign up for a panera card', 
					  rating: '4', 
					  cuisine: 'american'

starbucks = User.create! email: 'star@buck.s', 
						 password: 'starbucks', 
						 username: 'starbucks',
						 user_type: 'restaurant', 
					  	 description: 'cafe, expensive latte, partering with square payments', 
					  	 rating: '5', 
					  	 cuisine: 'hipster'

mcdonalds = User.create! email: 'mc@donald.s', 
						 password: 'panera', 
						 username: 'mcdonalds',
						 user_type: 'restaurant', 
					  	 description: 'fastfood, supersize me, bane of american health', 
					  	 rating: '2', 
					  	 cuisine: 'fatass'

sysco = User.create! email: 'Sy@s.co', 
					 password: 'sysco', 
					 username: 'sysco',
					 user_type: 'supplier', 
					 description: 'sells literally anything you could think of eating', 
					 rating: '4', 
					 cuisine: 'everything'

duo = User.create! email: 'd@u.o', 
				   password: 'duo', 
				   username: 'duo',
				   user_type: 'both', 
				   description: 'these guys play on both sides of the table', 
			       rating: '2', 
				   cuisine: 'harveydent'





				   