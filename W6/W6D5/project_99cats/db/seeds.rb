# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.delete_all

cat1 = Cat.create!(birth_date: '01/01/2000', color: 'gold', name: 'Beefy', sex: 'M', description: 'Big and fluffy.')
cat2 = Cat.create!(birth_date: '01/01/1990', color: 'gray', name: 'Speedy', sex: 'F', description: 'Faster than a speeding bullet.')
cat3 = Cat.create!(birth_date: '01/01/2010', color: 'black', name: 'Raven', sex: 'F', description: 'Hidden in the shadows.')
cat4 = Cat.create!(birth_date: '01/01/2021', color: 'white', name: 'Flash', sex: 'M', description: 'Appears before your very eyes.')