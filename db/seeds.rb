# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

puts "Importing countries..."
CSV.foreach(Rails.root.join("singers.csv"), headers: true) do |row|
  Singer.create! do |singer|
    singer.id = row[0]
    singer.name = row[1]
 . end
end

puts "Importing states..."
CSV.foreach(Rails.root.join("albums.csv"), headers: true) do |row|
  Album.create! do |state|
    album.name = row[0]
    album.singer_id = row[2]
  end
end