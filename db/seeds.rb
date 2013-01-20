# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.delete_all
open("#{Rails.root}/db/cities.txt") do |location|
  location.read.each_line do |city|
    name, country = city.chomp.split(",")
    City.create!(:name => name, :country => country)
  end
end