# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


derrick = User.create(name:"Derrick",password:'123')

first_question = Question.create(title:'What is ruby?',content:"I don't know what Ruby is. Please explain.",user: derrick)

first_answer = Answer.create(user: derrick, question: first_question, content:"Ruby is a programming language")

first_question.comments.create(content:'this is a stupid question', user:derrick)


first_answer.comments.create(user: derrick, content:"asdf")


