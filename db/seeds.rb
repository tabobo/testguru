# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ title: 'History' }, { title: 'Literature' }, { title: 'Music' }])
tests = Test.create([{ title: 'Russian history', level: 3, category_id: categories[0].id }, { title: 'English literature', level: 1, category_id: categories[1].id }, { title: 'Irish music'}, level: 2, category_id: categories[2].id])
questions = Question.create([{ body: 'Who was the first democratically elected president of Russia?', test_id: tests[0].id }, { body: "Who was the author of the famous storybook \'Alice's Adventures in Wonderland?\'", test_id: tests[1].id }, { body: 'What city or town in Ireland do the legendary rock band U2 hail from?', test_id: tests[2].id }])
answers = Answer.create([{ body: 'Boris Yeltsin', correct: true, question_id: questions[0].id }, { body: 'Charles Lutwidge Dodgson', correct: true, question_id: questions[1].id }, { body: 'Dublin', correct: true, question_id: questions[2].id }])
users = User.create([{ name: 'Alex' }, { name: 'Nina' }])
