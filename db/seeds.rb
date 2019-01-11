# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ceo = Role.create!(title: 'CEO')
vp = Role.create!(title: 'VP', parent: ceo)
director = Role.create!(title: 'Director', parent: vp)
manager = Role.create!(title: 'Manager', parent: director)
sde = Role.create!(title: 'SDE', parent: manager)