# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
Product.delete_all
Category.create(name: 'smathphone')

1000.times do |f|
	Product.create!(name: "iphone #{f}", price: f+1, category: Category.first, description: "description #{f}")
end