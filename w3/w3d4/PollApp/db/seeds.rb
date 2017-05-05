# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
u1 = User.create!(:user_name => "Trevor")
u2 = User.create!(:user_name => "Al")

Poll.destroy_all
p1 = Poll.create!(:title => 'Cats or Dogs?', :author_id => u1.id)
p2 = Poll.create!(:title => 'Pizza', :author_id => u2.id)

Question.destroy_all
q1 = Question.create!(:text => 'Are you allergic to cats?', :poll_id => p1.id)
q2 = Question.create!(:text => 'Are you allergic to dogs?', :poll_id => p1.id)
q3 = Question.create!(:text => 'Which is superior?', :poll_id => p1.id)
q4 = Question.create!(:text => 'Do you like pizza?', :poll_id => p2.id)
q5 = Question.create!(:text => 'How do you like your crust?', :poll_id => p2.id)
q6 = Question.create!(:text => 'What topping is best?', :poll_id => p2.id)

AnswerChoice.destroy_all
a1 = AnswerChoice.create!(:question_id => q1.id, :text => 'yes')
a2 = AnswerChoice.create!(:question_id => q1.id, :text => 'no')
a3 = AnswerChoice.create!(:question_id => q2.id, :text => 'yes')
a4 = AnswerChoice.create!(:question_id => q2.id, :text => 'no')
a5 = AnswerChoice.create!(:question_id => q3.id, :text => 'cats')
a6 = AnswerChoice.create!(:question_id => q3.id, :text => 'dogs')
a7 = AnswerChoice.create!(:question_id => q4.id, :text => 'yes')
a8 = AnswerChoice.create!(:question_id => q4.id, :text => 'no')
a9 = AnswerChoice.create!(:question_id => q5.id, :text => 'thin')
a10 = AnswerChoice.create!(:question_id => q5.id, :text => 'thick')
a11 = AnswerChoice.create!(:question_id => q6.id, :text => 'sausage')
a12 = AnswerChoice.create!(:question_id => q6.id, :text => 'pepperoni')
a13 = AnswerChoice.create!(:question_id => q6.id, :text => 'cheese')

Response.destroy_all
r1 = Response.create!(:user_id => u1.id, :answer_choice_id => a2.id)
r2 = Response.create!(:user_id => u1.id, :answer_choice_id => a4.id)
r3 = Response.create!(:user_id => u1.id, :answer_choice_id => a6.id)
r4 = Response.create!(:user_id => u2.id, :answer_choice_id => a7.id)
r5 = Response.create!(:user_id => u2.id, :answer_choice_id => a9.id)
r6 = Response.create!(:user_id => u2.id, :answer_choice_id => a11.id)
