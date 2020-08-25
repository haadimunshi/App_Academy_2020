# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
user1 = User.create!(username: 'CJ')
user2 = User.create!(username: 'Flarnie')
user3 = User.create!(username: 'Jeff')
user4 = User.create!(username: 'Georges St. Pierre')
user5 = User.create!(username: 'Ned')

Poll.destroy_all
poll1 = Poll.create!(title: 'color', author_id: user1.id)
poll2 = Poll.create!(author_id: user2.id, title: 'number')
poll3 = Poll.create!(author_id: user3.id, title: 'food')

Question.destroy_all
question1 = Question.create!(text: 'favorite color?', poll_id: poll1.id)
question2 = Question.create!(text: 'favorite number?', poll_id: poll2.id)
question3 = Question.create!(text: 'favorite food?', poll_id: poll3.id)

AnswerChoice.destroy_all
answerchoice1 = AnswerChoice.create!(text: 'A', question_id: question1.id)
answerchoice2 = AnswerChoice.create!(text: 'B', question_id: question2.id)
answerchoice3 = AnswerChoice.create!(text: 'C', question_id: question3.id)

Response.destroy_all
response1 = Response.create!(answer_choice_id: answerchoice1.id, respondent_id: user1.id)
response2 = Response.create!(answer_choice_id: answerchoice2.id, respondent_id: user2.id)
response3 = Response.create!(answer_choice_id: answerchoice3.id, respondent_id: user3.id)


