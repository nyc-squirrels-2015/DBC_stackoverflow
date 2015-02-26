# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


derrick = User.create(name:"Derrick",password:'123')

first_question = Question.create(title:'What is ruby?',content:"I don't know what Ruby is. Please explain.",user: derrick)

Answer.create(user: derrick, question: first_question, content:"Ruby is a programming language")

Comment.create(content:"",user: derrick, commentable_type:"Question",commentable_id:"")
