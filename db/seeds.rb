# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['jul', 'basia'].each do |login|
  user = User.new(:login => login, :password => 'password', :password_confirmation => 'password')
  user.save
  user.update_attribute(:admin, true)
end
