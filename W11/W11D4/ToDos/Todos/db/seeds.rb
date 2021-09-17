# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all

todo1 = Todo.create(title: "Pass React 1", body: "better study hard", done: false)
todo2 = Todo.create(title: "Pass Javascript 1", body: "new language", done: true)
todo3 = Todo.create(title: "Complete fullstack project", body: "so much to do", done: false)