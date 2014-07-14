# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Import quizzes
quizzes_json = JSON.parse(open("#{Dir.pwd}/db/quizzes.json").read)

quizzes_json["quizzes"].each do |quiz|
  new_quiz = Quiz.create

  quiz.each do |question, answers|
    new_question = new_quiz.questions.create body: question

    answers.each_with_index do |answer, i|
      new_question.answers.create correct: i.zero?, url: answer
    end
  end
end