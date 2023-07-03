# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'dokkoi@admin',
  password: 'silver')

require "csv"


CSV.foreach('db/genre.csv') do |row|
  Genre.create(:id => row[0], :name => row[1])
end