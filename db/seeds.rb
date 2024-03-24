# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_email|
#     MovieGenre.find_or_create_by!(email: genre_email)
#   end


User.destroy_all
Category.destroy_all
Test.destroy_all
Answer.destroy_all
Question.destroy_all
TestsUser.destroy_all

categories = Category.create!([
  {title: 'Backend'},
  {title: 'SQL'},
  {title: 'Full stack'}
])

users = User.create!([
  {email: 'AOR@gmail.com'},
  {email: 'SkiNy@gmail.com'},
  {email: 'Kaun@gmail.com'}
])

tests = Test.create!([
  {level: 0, title: 'SQL beginner', category_id: categories[1].id, owner_id: users[0].id},
  {level: 1, title: 'MSSQL', category_id: categories[1].id, owner_id: users[0].id},
  {level: 1, title: 'Postgresql', category_id: categories[1].id, owner_id: users[0].id},
  {level: 3, title: 'Ruby', category_id: categories[0].id, owner_id: users[1].id},
  {level: 4, title: '1C', category_id: categories[2].id, owner_id: users[2].id},
  {level: 8, title: 'Ruby rails', category_id: categories[2].id, owner_id: users[1].id}
])

questions = Question.create!([
  {body: 'Ruby интерпертируемый язык?', test_id: tests[0].id},
  {body: 'SQL имеет 4 основных действия?',  test_id: tests[1].id},
  {body: 'Ruby rails Выносить мозг как пушка?', test_id: tests[2].id}
])

answers = Answer.create!([
  {body: 'Answer for the first question : Yes!', correct: false, question_id: questions[0].id},
  {body: 'Answer for the first question : Yes!', correct: false, question_id: questions[0].id},
  {body: 'Answer for the first question : Yes!', correct: false, question_id: questions[0].id},
  {body: 'Answer for the first question : Yes!', question_id: questions[0].id},
  {body: 'Yes!', question_id: questions[1].id},
  {body: 'Yes!', question_id: questions[2].id}
])

TestsUser.create!([
  { test_id: tests[0].id, user_id: users[0].id }
])
