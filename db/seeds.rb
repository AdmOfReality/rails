# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Question.destroy_all
Test.destroy_all
User.destroy_all
Category.destroy_all
Answer.destroy_all

users = User.create!([
  {name: 'AOR'},
  {name: 'SkiNy'},
  {name: 'Kaun'}
])

categories = Category.create!([
  {title: 'Пивасик'},
  {title: 'Винишко'},
  {title: 'Вискарик'}
])

tests = Test.create!([
  {level: 1, title: 'Козел тёмное!', category_id: categories[0].id},
  {level: 2, title: 'Красненькое домашнее', category_id: categories[1].id},
  {level: 3, title: 'Вискарик чистым со льдом', category_id: categories[2].id}
])

questions = Question.create!([
  {body: 'Напиток пенный, витаминный, офигенный?', test_id: tests[0].id},
  {body: 'И с женою можно хлопнуть, и в компании друзей?',  test_id: tests[1].id},
  {body: 'Посидеть, смотря на огонь и потягивать неспеша?', test_id: tests[2].id}
])

answers = Answer.create!([
  {body: tests[0].title},
  {body: tests[1].title},
  {body: tests[2].title}
])
