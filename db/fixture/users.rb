# User.seed do |s|
#   s.id    = 1
#   s.username = "jon"
#   s.email = "jon@example.com"
#   s.password = "topsecret"
#   s.password_confirmation = "topsecret"
# end

# User.seed do |s|
#   s.id    = 2
#   s.username = "Ron"
#   s.email = "Ron@example.com"
#   s.password = "topsecret"
#   s.password_confirmation = "topsecret"
# end

#go to https://github.com/mbleigh/seed-fu   for directions

User.seed(:id,
  { :id => 1, :username => "jon",   :email => "jon@example.com",   :password => "topsecret", :password_confirmation => "topsecret"  },
  { :id => 2, :username => "emily", :email => "emily@example.com", :password => "topsecret", :password_confirmation => "topsecret"  }
)