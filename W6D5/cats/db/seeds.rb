# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat1 = Cat.create(birth_date: '2015/01/20', color: 'black', name: "Blacky", sex: 'M', description: 'This cat is black.')
cat2 = Cat.create(birth_date: '2015/02/20', color: 'white', name: "Whitey", sex: 'F', description: 'This cat is white.')
cat3 = Cat.create(birth_date: '2015/03/20', color: 'orange', name: "Orangey", sex: 'M', description: 'This cat is orange.')
cat4 = Cat.create(birth_date: '2015/04/20', color: 'brown', name: "Browny", sex: 'F', description: 'This cat is brown.')