# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Answer.destroy_all
Question.destroy_all
Test.destroy_all
User.destroy_all
Category.destroy_all


users = User.create!([
  {name: 'AOR'},
  {name: 'SkiNy'},
  {name: 'Kaun'}
])

categories = Category.create!([
  {title: 'Backend'},
  {title: 'SQL'},
  {title: 'Full stack'}
])

tests = Test.create!([
  {level: 1, title: 'Ruby', category_id: categories[0].id, user_id: users[0].id},
  {level: 2, title: 'SQL beginner', category_id: categories[1].id, user_id: users[1].id},
  {level: 3, title: 'Ruby rails', category_id: categories[2].id, user_id: users[2].id}
])

questions = Question.create!([
  {body: 'Ruby интерпертируемый язык?', test_id: tests[0].id},
  {body: 'SQL имеет 4 основных действия?',  test_id: tests[1].id},
  {body: 'Ruby rails Выносить мозг как пушка?', test_id: tests[2].id}
])

answers = Answer.create!([
  {body: 'Yes!', question_id: questions[0].id},
  {body: 'Yes!', question_id: questions[1].id},
  {body: 'Yes!', question_id: questions[2].id}
])
