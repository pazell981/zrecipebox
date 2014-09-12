# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1000.times {
	Recipe.create!(title: "Recipe", description: BetterLorem.p(1, true, false), ingredients: BetterLorem.p(1, false, false), instructions: BetterLorem.p(1, false, false))
}